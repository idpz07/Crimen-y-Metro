# ==============================================================================
# Purpose: Data Cleaning & Spatial Analytics for Metro Project
# Author: Antigravity (Assistant)
# Date created: 2024-04-26
# ==============================================================================

# Ensure spatial packages are installed
if (!require("sf", quietly = TRUE)) install.packages("sf", lib = Sys.getenv("R_LIBS_USER"), repos = "http://cran.us.r-project.org")
if (!require("osmdata", quietly = TRUE)) install.packages("osmdata", lib = Sys.getenv("R_LIBS_USER"), repos = "http://cran.us.r-project.org")

library(sf)
library(osmdata)

# 1. Load Crime Data -----------------------------------------------------------
file_crimes <- "Data storage/Raw/carpetas_fgj.csv"
if (!file.exists(file_crimes)) {
  stop("Missing carpetas_fgj.csv in Raw folder.")
}

message("Loading massive FGJ crime dataset...")
df_crimes_raw <- read_csv(file_crimes, show_col_types = FALSE) %>% clean_names()

# Filter for Pedestrian Robbery (Robo a transeunte) and clean coords
message("Filtering robberies and cleaning coordinates...")
df_robberies <- df_crimes_raw %>%
  filter(str_detect(tolower(delito), "robo a transeunte")) %>%
  filter(!is.na(latitud), !is.na(longitud)) %>%
  # Filter rough bounding box for CDMX to remove extreme GPS errors
  filter(latitud > 19.0 & latitud < 19.6, longitud > -99.4 & longitud < -98.9)

# Convert crimes to a spatial object (Simple Features)
# EPSG 4326 is standard GPS (WGS84)
crimes_sf <- st_as_sf(df_robberies, coords = c("longitud", "latitud"), crs = 4326)

# 2. Download Metro Stations via OpenStreetMap API -----------------------------
message("Fetching real-time Metro stations coordinates from OpenStreetMap...")
query <- opq("Ciudad de Mexico") %>%
  add_osm_feature(key = "station", value = "subway")
metro_data <- osmdata_sf(query)

metro_sf <- metro_data$osm_points
# Filter out empty geometry or features that aren't actually stations if any exist
metro_sf <- metro_sf[!is.na(metro_sf$name), ]

# Save Metro stations for the map script
metro_coords <- data.frame(
  name = metro_sf$name,
  longitud = st_coordinates(metro_sf)[,1],
  latitud = st_coordinates(metro_sf)[,2]
)
write_csv(metro_coords, "Data storage/Created/metro_stations.csv")

# 3. Spatial Analytics: Distance to Nearest Station ----------------------------
message("Calculating spatial distances in meters...")
# To calculate accurate distances in METERS, we must project both datasets 
# to a planar coordinate system (UTM Zone 14N for Central Mexico = EPSG:32614)
crimes_proj <- st_transform(crimes_sf, crs = 32614)
metro_proj <- st_transform(metro_sf, crs = 32614)

# Find the index of the nearest Metro station for EACH crime
nearest_station_idx <- st_nearest_feature(crimes_proj, metro_proj)

# Calculate the precise distance (in meters) to that nearest station
distances <- st_distance(
  crimes_proj, 
  metro_proj[nearest_station_idx, ], 
  by_element = TRUE # This prevents calculating a massive NxM matrix, only 1-to-1
)

# Extract numeric value in meters and add it to our dataframe
df_robberies$dist_to_metro_m <- as.numeric(distances)

# 4. Save Clean Data -----------------------------------------------------------
output_file <- "Data storage/Created/metro_crimes_distances.csv"
write_csv(df_robberies, output_file)
message(sprintf("Clean dataset saved to %s", output_file))
