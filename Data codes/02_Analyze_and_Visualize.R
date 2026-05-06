# ==============================================================================
# Purpose: Analyze spatial decay and patterns of crimes around Metro stations
# Author: Antigravity (Assistant)
# Date created: 2024-04-26
# ==============================================================================

# Ensure lubridate is loaded for temporal analytics
if (!require("lubridate", quietly = TRUE)) install.packages("lubridate", lib = Sys.getenv("R_LIBS_USER"), repos = "http://cran.us.r-project.org")
library(lubridate)
library(dplyr)
library(readr)
library(ggplot2)
library(stringr)

# 1. Load Data -----------------------------------------------------------------
file_clean <- "Data storage/Created/metro_crimes_distances.csv"
if (!file.exists(file_clean)) stop("Clean data not found.")

df_robberies <- read_csv(file_clean, show_col_types = FALSE)

# 2. Basic Analytics (Summary Stats) -------------------------------------------
median_dist <- median(df_robberies$dist_to_metro_m, na.rm = TRUE)
mean_dist <- mean(df_robberies$dist_to_metro_m, na.rm = TRUE)

sink("Writeup/spatial_summary.txt")
cat("=========================================================\n")
cat("Spatial Analytics: Robberies vs Metro Stations\n")
cat("=========================================================\n")
cat(sprintf("Total robberies analyzed: %d\n", nrow(df_robberies)))
cat(sprintf("Median distance to nearest Metro: %.2f meters\n", median_dist))
cat(sprintf("Mean distance to nearest Metro: %.2f meters\n", mean_dist))
pct_within_500 <- mean(df_robberies$dist_to_metro_m <= 500, na.rm = TRUE) * 100
cat(sprintf("Percentage of robberies within 500m of a Metro: %.1f%%\n", pct_within_500))
sink()

# Filter for visualization (remove extreme CDMX outliers > 3km)
df_viz <- df_robberies %>% filter(dist_to_metro_m <= 3000)

# ==============================================================================
# 3. Figure 1: Spatial Decay (Density Plot) 
# ==============================================================================
fig_decay <- ggplot(df_viz, aes(x = dist_to_metro_m)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = 100, fill = "#2c3e50", color = "white", alpha = 0.6) +
  geom_density(color = "#e74c3c", linewidth = 1.2) +
  geom_vline(xintercept = median_dist, linetype = "dashed", color = "black", linewidth = 0.8) +
  annotate("text", x = median_dist + 100, y = 0.0008, label = paste("Mediana:", round(median_dist, 0), "m"), hjust = 0, fontface="bold") +
  theme_classic() +
  labs(
    title = "Efecto Cuello de Botella: El Crimen Sigue a las Masas",
    subtitle = "La densidad de asaltos a transeúntes decae drásticamente conforme te alejas del Metro.",
    x = "Distancia a la estación de Metro más cercana (Metros)",
    y = "Densidad Relativa de Asaltos",
    caption = "Fuente: FGJ CDMX y OpenStreetMap."
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 11, color = "darkgray"),
    axis.title = element_text(face = "bold"),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

ggsave("Writeup/Figure1_Crime_Decay.png", plot = fig_decay, width = 10, height = 6, dpi = 300)

# ==============================================================================
# 4. Figure 3: El Reloj del Viajero (Heatmap Temporal)
# ==============================================================================
# Filter to crimes that happened CLOSE to the metro (e.g. <= 500m) to see the commuting effect
df_time <- df_robberies %>%
  filter(dist_to_metro_m <= 500) %>%
  mutate(
    hora = hour(hms(hora_hecho)),
    dia = wday(ymd(fecha_hecho), label = TRUE, abbr = FALSE)
  ) %>%
  filter(!is.na(hora) & !is.na(dia)) %>%
  count(dia, hora)

fig_time <- ggplot(df_time, aes(x = hora, y = dia, fill = n)) +
  geom_tile(color = "white") +
  scale_fill_viridis_c(option = "magma", name = "No. Asaltos") +
  scale_x_continuous(breaks = 0:23) +
  theme_minimal() +
  labs(
    title = "El Reloj del Viajero: Asaltos Cerca del Metro",
    subtitle = "Los asaltos se concentran en las horas pico de entrada y salida laboral (7-8 AM y 7-9 PM).",
    x = "Hora del Día",
    y = "Día de la Semana",
    caption = "Fuente: FGJ CDMX (Solo asaltos a <500m de una estación)."
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 11, color = "darkgray"),
    panel.grid = element_blank()
  )

ggsave("Writeup/Figure3_Time_Heatmap.png", plot = fig_time, width = 10, height = 6, dpi = 300, bg="white")

# ==============================================================================
# 5. Figure 4: Violencia vs Sigilo
# ==============================================================================
df_violencia <- df_viz %>%
  mutate(
    tipo = case_when(
      str_detect(tolower(delito), "sin violencia") ~ "Sin Violencia (Carteristas)",
      str_detect(tolower(delito), "con violencia") ~ "Con Violencia (Asalto armado)",
      TRUE ~ "Otro"
    )
  ) %>%
  filter(tipo != "Otro")

fig_violencia <- ggplot(df_violencia, aes(x = dist_to_metro_m, fill = tipo, color = tipo)) +
  geom_density(alpha = 0.4, linewidth = 1) +
  theme_classic() +
  labs(
    title = "Violencia vs. Sigilo en los Alrededores del Metro",
    subtitle = "Los robos sin violencia ocurren casi dentro de las estaciones; los asaltos violentos suceden ligeramente más lejos.",
    x = "Distancia a la estación de Metro más cercana (Metros)",
    y = "Densidad Relativa",
    fill = "Tipo de Robo",
    color = "Tipo de Robo"
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 11, color = "darkgray"),
    legend.position = "top"
  )

ggsave("Writeup/Figure4_Violence_Decay.png", plot = fig_violencia, width = 10, height = 6, dpi = 300, bg="white")

# ==============================================================================
# 6. Figure 5: Gráfica de Porcentaje Acumulado (ECDF)
# ==============================================================================
fig_ecdf <- ggplot(df_robberies, aes(x = dist_to_metro_m)) +
  stat_ecdf(geom = "step", color = "#2980b9", linewidth = 1.2) +
  scale_y_continuous(labels = scales::percent, breaks = seq(0, 1, by = 0.2)) +
  scale_x_continuous(breaks = seq(0, 3000, by = 500), limits = c(0, 3000)) +
  geom_hline(yintercept = 0.5, linetype = "dotted", color = "gray50") +
  theme_minimal() +
  labs(
    title = "El Riesgo Acumulado de la Caminata a Casa",
    subtitle = "El 35.3% de todos los asaltos a transeúnte de la CDMX ocurren a menos de 500 metros del Metro.",
    x = "Distancia al Metro (Metros)",
    y = "Porcentaje Acumulado de Asaltos Totales",
    caption = "Fuente: FGJ CDMX y OpenStreetMap."
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    panel.grid.minor = element_blank()
  )

ggsave("Writeup/Figure5_ECDF.png", plot = fig_ecdf, width = 10, height = 6, dpi = 300, bg="white")

message("Extended Analytics complete. Check Writeup/ for all 4 new figures.")
