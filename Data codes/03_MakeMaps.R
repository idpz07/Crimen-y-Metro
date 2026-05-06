# ==============================================================================
# Purpose: Create spatial maps showing crime density vs Metro stations in CDMX
# Author: Antigravity (Assistant)
# Date created: 2024-04-26
# ==============================================================================

# Ensure spatial packages are installed
if (!require("sf", quietly = TRUE)) install.packages("sf", lib = Sys.getenv("R_LIBS_USER"), repos = "http://cran.us.r-project.org")
if (!require("geodata", quietly = TRUE)) install.packages("geodata", lib = Sys.getenv("R_LIBS_USER"), repos = "http://cran.us.r-project.org")
library(sf)
library(geodata)
library(ggplot2)
library(dplyr)
library(readr)

# 1. Load Data -----------------------------------------------------------------
file_crimes <- "Data storage/Created/metro_crimes_distances.csv"
file_metro <- "Data storage/Created/metro_stations.csv"

if (!file.exists(file_crimes) | !file.exists(file_metro)) {
  stop("Clean datasets not found. Please run 01_Clean_Data.R first.")
}

df_crimes <- read_csv(file_crimes, show_col_types = FALSE)
df_metro <- read_csv(file_metro, show_col_types = FALSE)

# 2. Load CDMX Boundaries ------------------------------------------------------
message("Downloading/Loading Official Mexico boundaries...")
mx_boundaries <- gadm(country = "MEX", level = 2, path = "Data storage/")
cdmx_boundaries_terra <- mx_boundaries[mx_boundaries$NAME_1 == "Ciudad de Mexico", ]
cdmx_boundaries <- st_as_sf(cdmx_boundaries_terra)

# 3. Create the Heatmap Visualization ------------------------------------------
message("Generating Spatial Map...")
fig_map <- ggplot() +
  # Draw the CDMX Alcaldias boundaries
  geom_sf(data = cdmx_boundaries, fill = "gray95", color = "gray50", linewidth = 0.5) +
  # Add 2D Density (Heatmap) for robberies
  stat_density_2d(
    data = df_crimes, 
    aes(x = longitud, y = latitud, fill = after_stat(level)), 
    geom = "polygon", 
    alpha = 0.5,
    bins = 15
  ) +
  # Color scale for the heatmap (Viridis "inferno" looks like heat)
  scale_fill_viridis_c(option = "inferno") +
  # Overlay the Metro stations as distinct points
  geom_point(
    data = df_metro,
    aes(x = longitud, y = latitud), 
    color = "black", shape = 21, fill = "white", size = 2, stroke = 1
  ) +
  # Clean theme
  theme_void() +
  theme(
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA),
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5, margin = margin(t = 10, b = 5)),
    plot.subtitle = element_text(size = 11, color = "darkgray", hjust = 0.5, margin = margin(b = 15)),
    legend.position = "right",
    legend.title = element_text(face = "bold"),
    plot.margin = margin(10, 10, 10, 10)
  ) +
  labs(
    title = "Hotspots de Asaltos y la Red del Metro CDMX",
    subtitle = "Los asaltos (zonas rojas/amarillas) se aglomeran sobre las estaciones del Metro (puntos).",
    fill = "Densidad\nde Asaltos",
    caption = "Fuente: Datos Abiertos CDMX (FGJ) y OpenStreetMap."
  )

# 4. Save Map ------------------------------------------------------------------
ggsave("Writeup/Figure2_Map.png", plot = fig_map, width = 10, height = 8, dpi = 300, bg = "white")
message("Map generated successfully in Writeup/Figure2_Map.png")
