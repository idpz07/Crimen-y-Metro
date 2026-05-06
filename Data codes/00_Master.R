# ==============================================================================
# Purpose: Master script for the project "Focos Fundidos y Crimen en CDMX"
# Author: Antigravity (Assistant)
# Date created: 2024-04-25
# Last modified: 2026-05-06
# ==============================================================================

# 1. Install and Load Packages -------------------------------------------------
# Ensure a local user library exists to avoid permission errors when installing
local_lib <- Sys.getenv("R_LIBS_USER")
if (!dir.exists(local_lib)) dir.create(local_lib, recursive = TRUE)
.libPaths(c(local_lib, .libPaths()))

# We use pacman to easily manage package installations
if (!require("pacman", quietly = TRUE)) install.packages("pacman", lib = local_lib, repos = "http://cran.us.r-project.org")

pacman::p_load(
  tidyverse,  # For data manipulation (dplyr, ggplot2, readr)
  lubridate,  # For date manipulation
  janitor,    # For cleaning column names
  viridis     # For aesthetic, colorblind-friendly palettes
)

# 2. Set Working Directory -----------------------------------------------------
# Note: The user MUST set this to the parent folder of the project.
# Since we are using RStudio projects or relative paths, we assume the working 
# directory is the root of the project "Efecto tacos de canasta".
# Example: setwd("C:/Users/damar/OneDrive/Desktop/Antigravity projects/Efecto tacos de canasta")

# 3. Execute Scripts in Order --------------------------------------------------
# The following scripts will be sourced. They are ordered numerically to 
# ensure reproducibility.

print("Running 01_Clean_Data.R...")
source("Data codes/01_Clean_Data.R")

print("Running 02_Analyze_and_Visualize.R...")
source("Data codes/02_Analyze_and_Visualize.R")

print("Running 03_MakeMaps.R...")
source("Data codes/03_MakeMaps.R")

print("Running 04_ITS_L12_Closure.R...")
source("Data codes/04_ITS_L12_Closure.R")


print("All scripts executed successfully. Check the Writeup folder for outputs.")
