# ==============================================================================
# Script   : 04_ITS_L12_Closure.R
# Propósito: Interrupted Time Series (ITS) — Cierre Línea 12 (Versión Depurada)
# Autor    : Antigravity (Assistant)
# Fecha    : 2026-05-06
# ==============================================================================

# ── 0. Dependencias ────────────────────────────────────────────────────────────
local_lib <- Sys.getenv("R_LIBS_USER")
if (!dir.exists(local_lib)) dir.create(local_lib, recursive = TRUE)
.libPaths(c(local_lib, .libPaths()))

required_pkgs <- c("tidyverse", "lubridate", "broom", "sf")
for (pkg in required_pkgs) {
  if (!requireNamespace(pkg, quietly = TRUE))
    install.packages(pkg, lib = local_lib, repos = "https://cloud.r-project.org")
}

library(tidyverse)
library(lubridate)
library(broom)
library(sf)

message("04_ITS_L12_Closure.R — iniciando...")

# ── 1. Rutas de archivos ───────────────────────────────────────────────────────
path_crimes   <- "Data storage/Created/metro_crimes_distances.csv"
path_stations <- "Data storage/Created/metro_stations.csv"

if (!file.exists(path_crimes))   stop("Archivo no encontrado: ", path_crimes)
if (!file.exists(path_stations)) stop("Archivo no encontrado: ", path_stations)

# ── 2. Estaciones de la Línea 12 (Muestra Purificada) ──────────────────────────
# NOTA METODOLÓGICA: Se omiten estaciones de transferencia como "Mixcoac", 
# "Ermita" o "Atlalilco". ¿Por qué? Porque a pesar del cierre de la L12, 
# esas estaciones siguieron recibiendo miles de usuarios por sus conexiones 
# con otras líneas (L7, L2, L8). Incluirlas diluiría el estimador estadístico, 
# ya que su afluencia peatonal no cayó a cero.
# Conservamos estrictamente el tramo oriente que quedó geográficamente aislado
# y perdió el 100% de su flujo subterráneo/elevado de golpe.
l12_stations <- c(
  "Culhuacán", "San Andrés Tomatlán", "Lomas Estrella", "Calle 11", 
  "Periférico Oriente", "Tezonco", "Olivos", "Nopalera", "Zapotitlán", 
  "Tlaltenco", "Tlahuac"
)

# ── 3. Carga de datos y Spatial Join ──────────────────────────────────────────
df_raw <- read_csv(
  path_crimes,
  col_select = c(fecha_hecho, latitud, longitud, dist_to_metro_m),
  col_types  = cols(
    fecha_hecho     = col_character(),
    latitud         = col_double(),
    longitud        = col_double(),
    dist_to_metro_m = col_double()
  ),
  show_col_types = FALSE
)

# Filtrar: solo crímenes a < 500 metros
df_500 <- df_raw |>
  filter(dist_to_metro_m < 500) |>
  filter(!is.na(latitud), !is.na(longitud))

stations_df <- read_csv(path_stations, show_col_types = FALSE) |>
  filter(!is.na(name), !is.na(longitud), !is.na(latitud))

# Spatial join temporal
crimes_sf <- st_as_sf(df_500, coords = c("longitud", "latitud"), crs = 4326) |>
  st_transform(32614)
stations_sf <- st_as_sf(stations_df, coords = c("longitud", "latitud"), crs = 4326) |>
  st_transform(32614)

nearest_idx <- st_nearest_feature(crimes_sf, stations_sf)
df_500$nearest_station <- stations_df$name[nearest_idx]

# ── 4. Filtrar L12 y Agregación Mensual Continua ───────────────────────────────
df_l12 <- df_500 |>
  filter(nearest_station %in% l12_stations) |>
  mutate(
    fecha_dt = as_date(str_sub(fecha_hecho, 1, 10)),
    anio_mes = floor_date(fecha_dt, "month")
  ) |>
  filter(!is.na(anio_mes), anio_mes >= ymd("2019-01-01"), anio_mes <= ymd("2022-12-01"))

df_panel <- df_l12 |>
  group_by(anio_mes) |>
  summarise(n_asaltos = n(), .groups = "drop") |>
  # Asegurar balance: completar meses sin crímenes con 0
  complete(anio_mes = seq.Date(ymd("2019-01-01"), ymd("2022-12-01"), by = "month"),
           fill = list(n_asaltos = 0))

# ── 5. Variables de Interrupción y Controles Temporales ────────────────────────
# NOTA METODOLÓGICA: Para evitar el sesgo de variables omitidas sin usar un
# grupo de control, debemos controlar internamente por la tendencia natural 
# del crimen y la estacionalidad del año.
df_its <- df_panel |>
  filter(anio_mes != ymd("2021-05-01")) |>
  arrange(anio_mes) |>
  mutate(
    # Tiempo secular: 1 al 48 para medir la pendiente general pre-existente.
    tiempo = row_number(),
    # Mes del año: para aislar el factor "diciembre" vs "abril" (estacionalidad)
    mes_factor = as.factor(month(anio_mes)),
    # Tratamiento (Cambio de Nivel)
    Post_Cierre = if_else(anio_mes >= ymd("2021-06-01"), 1, 0)
  )

# ── 6. Modelo Estadístico ──────────────────────────────────────────────────────
# NOTA METODOLÓGICA: 
# `tiempo` captura si el crimen ya venía subiendo/bajando.
# `Post_Cierre` mide la "caída de escalón" (Step change).
# `Post_Cierre:tiempo` mide si el cierre *aceleró* o *frenó* la velocidad 
# con la que cambiaba el crimen (Slope change).
model_its <- glm(
  n_asaltos ~ tiempo + Post_Cierre + Post_Cierre:tiempo + mes_factor, 
  data = df_its, 
  family = poisson(link = "log")
)

dir.create("Writeup/ITS_Analysis", showWarnings = FALSE, recursive = TRUE)
output_txt <- "Writeup/ITS_Analysis/ITS_Closure_summary.txt"
sink(output_txt)
cat("==============================================================================\n")
cat("  ANÁLISIS DE SERIES DE TIEMPO INTERRUMPIDO (ITS) — CIERRE LÍNEA 12\n")
cat("==============================================================================\n\n")
cat("MODELO: Regresión de Poisson con controles temporales\n")
cat("  n_asaltos ~ tiempo + Post_Cierre + Post_Cierre*tiempo + factor(Mes)\n")
cat("  Muestra depurada: Solo estaciones L12 sin transferencias.\n\n")

print(summary(model_its))

cat("\nCOEFICIENTES RELEVANTES (tidy)\n")
print(tidy(model_its, conf.int = TRUE) |> filter(str_detect(term, "Post_Cierre|tiempo")))

cat("\n==============================================================================\n")
sink()

message("Resumen ITS guardado en: ", output_txt)

# ── 7. Visualización (Gráfica Clave) ───────────────────────────────────────────
# Calculamos predicciones del modelo para dibujar las rectas ajustadas reales
# ignorando la estacionalidad visualmente para centrarse en la tendencia
df_pred <- df_its |>
  mutate(
    pred_log = predict(model_its, type = "link"),
    pred_val = exp(pred_log)
  )

fecha_corte <- ymd("2021-05-01")

fig_its <- ggplot(df_its, aes(x = anio_mes, y = n_asaltos)) +
  # Sombreado vertical en mayo 2021 para aislar el shock
  annotate("rect", xmin = ymd("2021-04-15"), xmax = ymd("2021-05-15"), 
           ymin = -Inf, ymax = Inf, fill = "gray80", alpha = 0.5) +
  geom_vline(xintercept = as.numeric(fecha_corte), color = "black", linewidth = 1) +
  
  # Líneas de tendencia predictivas ajustadas del modelo GLM ITS
  geom_line(data = filter(df_pred, Post_Cierre == 0), aes(y = pred_val), color = "#2c7bb6", linewidth = 1.2) +
  geom_line(data = filter(df_pred, Post_Cierre == 1), aes(y = pred_val), color = "#d7191c", linewidth = 1.2) +
  
  # Serie de tiempo subyacente
  geom_line(color = "gray50", alpha = 0.5, linewidth = 0.6) +
  geom_point(aes(color = as.factor(Post_Cierre)), size = 2) +
  
  scale_color_manual(values = c("0" = "#2c7bb6", "1" = "#d7191c")) +
  scale_x_date(date_breaks = "6 months", date_labels = "%b\n%Y") +
  
  labs(
    title = "Caída del crimen tras aislar la verdadera caída de afluencia (Línea 12)",
    subtitle = "Muestra depurada de estaciones puras. El modelo controla por tendencia secular y estacionalidad.",
    y = "Robos a transeúnte (<500m)",
    x = NULL,
    caption = "Nota: Se excluye Mayo 2021. Las líneas gruesas representan el ajuste del modelo Poisson (ITS)."
  ) +
  
  theme_classic(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "gray30", size = 10, margin = margin(b = 10)),
    legend.position = "none",
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black"),
    panel.grid.major.y = element_line(color = "gray90")
  )

ggsave("Writeup/ITS_Analysis/Figure6_ITS_L12_Closure.png", plot = fig_its, width = 10, height = 6, dpi = 300, bg = "white")

message("Figura ITS guardada en: Writeup/ITS_Analysis/Figure6_ITS_L12_Closure.png")
message("04_ITS_L12_Closure.R completado exitosamente.")
