# clear workspace
rm(list = ls())

library(terra)
library(sf)
library(dplyr)

# Load the sensor locations CSV
sensor_locations <- read.csv("../data/sensor/sensor_sites_2025.csv")

# Convert to sf object with WGS84 coordinates
sensor_locations <- st_as_sf(
  sensor_locations, 
  coords = c("long_Sensor_location", "lat_Sensor_location"),
  crs = "EPSG:4326"
)

# Convert sensor locations to BNG (EPSG:27700)
sensor_locations <- st_transform(sensor_locations, crs = "EPSG:27700")

# Load the four 10m Sentinel-2 bands for Silwood
s2_silwood_10m <- rast(
  c(
    "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B02_10m.tiff",
    "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B03_10m.tiff",
    "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B04_10m.tiff",
    "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B08_10m.tiff"
  )
) / 10000

names(s2_silwood_10m) <- c("B", "G", "R", "NIR")

# ---- Calculate EVI for Silwood ----
evi_silwood <- 2.5 * 
  (s2_silwood_10m[["NIR"]] - s2_silwood_10m[["R"]]) / 
  (s2_silwood_10m[["NIR"]] + 
    6 * s2_silwood_10m[["R"]] - 
    7.5 * s2_silwood_10m[["B"]] + 1)

# Rename the band
names(evi_silwood) <- "EVI"

# Remove anomalous EVI values
evi_silwood[evi_silwood > 1 | evi_silwood < -1] <- NA

# ---- Extract EVI values at sensor locations ----
sensor_evi_silwood <- terra::extract(evi_silwood, sensor_locations)

# Attach EVI values to the sensor_locations data frame
sensor_locations$EVI_Silwood <- sensor_evi_silwood[, "EVI"]

# sensor_locations now contains EVI values for Silwood only


names(s2_silwood_10m) <- "R"

# Load sensor locations CSV
sensor_locations <- read.csv("../data/sensor/sensor_sites_2025.csv")

# Convert to sf object with WGS84 coordinates
sensor_locations <- st_as_sf(
  sensor_locations,
  coords = c("long_Sensor_location", "lat_Sensor_location"),
  crs = 4326
)

# Create a PDF
pdf("../results/silwood_sensor_locations.pdf")

sensor_locations <- st_transform(sensor_locations, crs(evi_silwood))

# Plot to screen
plot(evi_silwood, main = "Sensor Locations at Silwood Raster")
plot(st_geometry(sensor_locations), add = TRUE,
     pch = 18, cex = 2.4, col = "white")

# Coloured point on top
plot(st_geometry(sensor_locations), add = TRUE,
     pch = 18, cex = 2, col = "black")

dev.off()
















# Path to tables directory
tables_dir <- "../data/tables"

read_csv_filled <- function(file, all_cols) {
  df <- read.csv(file, stringsAsFactors = FALSE)
  
  # Add missing columns with NA
  missing_cols <- setdiff(all_cols, names(df))
  for (col in missing_cols) df[[col]] <- NA
  
  # Keep only the standard columns in the correct order
  df <- df[, all_cols]
  return(df)
}

# First, get all possible column names across all CSVs
all_cols <- unique(unlist(lapply(csv_files, function(f) names(read.csv(f, nrows=1)))))

# Read and merge all CSVs
merged_tables <- do.call(rbind, lapply(csv_files, read_csv_filled, all_cols = all_cols))

output_file <- "../results/merged_tables.csv"

write.csv(merged_tables, file = output_file, row.names = FALSE)

cat("Merged CSV saved to:", output_file, "\n")




library(lubridate)

output_file_2 <- read.csv("../results/merged_tables_update.csv")
dates_raw <- output_file_2$Date
merged_tables$Date_parsed <- parse_date_time(dates_raw, orders = c("ymd", "dmy"))
merged_tables$Date_parsed <- as.Date(merged_tables$Date_parsed)

output_file <- "../results/merged_tables_2.csv"

write.csv(merged_tables, file = output_file, row.names = FALSE)

cat("Merged CSV saved to:", output_file, "\n")


output_file_3 <- read.csv("../results/merged_tables_2.csv")

print(muntiacus_days)


library(tibble)

# Create a tidy data frame with Group_number and EVI_Silwood
sensor_evi_df <- tibble(
  Station = sensor_locations$Grid,
  EVI_Silwood  = sensor_locations$EVI_Silwood
)

# Print the data frame
print(sensor_evi_df)

output_file <- "../results/sensor_evi_silwood.csv"

write.csv(sensor_evi_df, file = output_file, row.names = FALSE)

cat("CSV saved to:", output_file, "\n")
