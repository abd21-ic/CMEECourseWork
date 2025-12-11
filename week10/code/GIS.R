#install.packages(c("terra", "sf", "rcartocolor", "rpart"))

library(terra)       # core raster GIS package
library(sf)          # core vector GIS package
library(rcartocolor) # plotting
library(rpart)

# Load the data from the CSV file
sensor_locations <- read.csv("../data/sensor/sensor_sites_2025.csv")

# Convert to an sf object by setting the fields containing X and Y data and set 
# the projection of the dataset
sensor_locations <- st_as_sf(
  sensor_locations, 
  coords=c("long_Sensor_location","lat_Sensor_location"),
  crs="EPSG:4326"
)

nest_boxes <- st_read("../data/NestBoxes/NestBoxes.shp")
print(head(nest_boxes))

nhm_aerial <- rast('../data/SpatialMethods/aerial/nhm_aerial.tiff')
silwood_aerial <- rast('../data/SpatialMethods/aerial/silwood_aerial.tiff')

print(nhm_aerial)

# Load the DTM data from ASC format files
silwood_dtm_SU96NE <- rast("../data/SpatialMethods/dtm_5m/SU96NE.asc")
silwood_dtm_SU96NW <- rast("../data/SpatialMethods/dtm_5m/SU96NW.asc")
nhm_dtm_TQ27NE <- rast("../data/SpatialMethods/dtm_5m/TQ27NE.asc")
nhm_dtm_TQ28SE <- rast("../data/SpatialMethods/dtm_5m/TQ28SE.asc")

# Look at the object data
silwood_dtm_SU96NE

# Set the projection information for the DTM datasets
crs(silwood_dtm_SU96NE) <- crs(silwood_dtm_SU96NW) <- "EPSG:27700"
crs(nhm_dtm_TQ27NE) <- crs(nhm_dtm_TQ28SE) <- "EPSG:27700"

# Print the modified dataset
silwood_dtm_SU96NE

# Load the land cover map datasets
silwood_LCM <- rast("../data/SpatialMethods/lcm_2024/Silwood_LCM2024.tiff")
nhm_LCM <- rast("../data/SpatialMethods/lcm_2024/NHM_LCM2024.tiff")

# Look at the raster details
print(silwood_LCM)

plot(silwood_LCM)


lcm_info <- read.csv("../data/SpatialMethods/lcm_2024/LCM2024_info.csv")

# Set the band names, the category code labels and the colour tables
levels(nhm_LCM) <- lcm_info[c("value", "label")]
coltab(nhm_LCM) <- lcm_info[c("value", "color")]
names(nhm_LCM) <- c("LandCover", "Certainty")

coltab(silwood_LCM) <- lcm_info[c("value", "color")]
levels(silwood_LCM) <- lcm_info[c("value", "label")]
names(silwood_LCM) <- c("LandCover", "Certainty")

par(mfrow=c(1,2))
plot(silwood_LCM["LandCover"])
plot(nhm_LCM["LandCover"])

nhm_freq <- freq(nhm_LCM["LandCover"])
silwood_freq <- freq(silwood_LCM["LandCover"])

# Join the two datasets, including all categories
merge(
  nhm_freq, silwood_freq, 
  by="value", all=TRUE, suffixes = c(".nhm", ".silwood")
)

par(mar = c(4, 12, 1, 1))

# Plot cell assignment certainties as a function of land cover category
boxplot(
  silwood_LCM["Certainty"], silwood_LCM["LandCover"], 
  las = 1, ylab = "", horizontal=TRUE, main="Silwood", xlab="Certainty"
)
boxplot(
  nhm_LCM["Certainty"], nhm_LCM["LandCover"], 
  las = 1, ylab = "", horizontal=TRUE, main="NHM", xlab="Certainty"
)

print(st_layers("../data/SpatialMethods/VML/vml-su96ne.gpkg"))

# Load the two panes of VML road centrelines for each site.
vml_tq28se_roads <- st_read(
  dsn = "../data/SpatialMethods/VML/vml-tq28se.gpkg", layer = "Road_Centreline"
)
vml_tq27ne_roads <- st_read(
  dsn = "../data/SpatialMethods/VML/vml-tq27ne.gpkg", layer = "Road_Centreline"
)
vml_su96ne_roads <- st_read(
  dsn = "../data/SpatialMethods/VML/vml-su96ne.gpkg", layer = "Road_Centreline"
)
vml_su96nw_roads <- st_read(
  dsn = "../data/SpatialMethods/VML/vml-su96nw.gpkg", layer = "Road_Centreline"
)

# Do the same for water bodies
vml_tq28se_water <- st_read(
  dsn = "../data/SpatialMethods/VML/vml-tq28se.gpkg", layer = "Water_Area"
)
vml_tq27ne_water <- st_read(
  dsn = "../data/SpatialMethods/VML/vml-tq27ne.gpkg", layer = "Water_Area"
)
vml_su96ne_water <- st_read(
  dsn = "../data/SpatialMethods/VML/vml-su96ne.gpkg", layer = "Water_Area"
)
vml_su96nw_water <- st_read(
  dsn = "../data/SpatialMethods/VML/vml-su96nw.gpkg", layer = "Water_Area"
)

# Load the four 10m resolution Sentinel 2 bands for Silwood
s2_silwood_10m <- rast(
    c(
        "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B02_10m.tiff",
        "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B03_10m.tiff",
        "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B04_10m.tiff",
        "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B08_10m.tiff"
    ),
)  / 10000

# Name the bands 
names(s2_silwood_10m) <- c("B", "G", "R", "NIR")

# Do the same for the NHM
s2_nhm_10m <- rast(
    c(
        "../data/SpatialMethods/sentinel_2/R10m/nhm/T30UXC_20250711T110651_B02_10m.tiff",
        "../data/SpatialMethods/sentinel_2/R10m/nhm/T30UXC_20250711T110651_B03_10m.tiff",
        "../data/SpatialMethods/sentinel_2/R10m/nhm/T30UXC_20250711T110651_B04_10m.tiff",
        "../data/SpatialMethods/sentinel_2/R10m/nhm/T30UXC_20250711T110651_B08_10m.tiff"
    ),
) / 10000
names(s2_nhm_10m) <- c("B", "G", "R", "NIR")

# Load the six 20m resolution Sentinel 2 bands for Silwood
s2_silwood_20m <- rast(
    c(
        "../data/SpatialMethods/sentinel_2/R20m/silwood/T30UXC_20250711T110651_B05_20m.tiff",
        "../data/SpatialMethods/sentinel_2/R20m/silwood/T30UXC_20250711T110651_B06_20m.tiff",
        "../data/SpatialMethods/sentinel_2/R20m/silwood/T30UXC_20250711T110651_B07_20m.tiff",
        "../data/SpatialMethods/sentinel_2/R20m/silwood/T30UXC_20250711T110651_B8A_20m.tiff",
        "../data/SpatialMethods/sentinel_2/R20m/silwood/T30UXC_20250711T110651_B11_20m.tiff",
        "../data/SpatialMethods/sentinel_2/R20m/silwood/T30UXC_20250711T110651_B12_20m.tiff"
    ),
) / 10000

# Name the bands 
names(s2_silwood_20m) <- c("RE5", "RE6", "RE7", "NNIR", "SWIR1", "SWIR2")

# Load the seven 20m resolution Sentinel 2 bands for the NHM
s2_nhm_20m <- rast(
    c(
        "../data/SpatialMethods/sentinel_2/R20m/nhm/T30UXC_20250711T110651_B05_20m.tiff",
        "../data/SpatialMethods/sentinel_2/R20m/nhm/T30UXC_20250711T110651_B06_20m.tiff",
        "../data/SpatialMethods/sentinel_2/R20m/nhm/T30UXC_20250711T110651_B07_20m.tiff",
        "../data/SpatialMethods/sentinel_2/R20m/nhm/T30UXC_20250711T110651_B8A_20m.tiff",
        "../data/SpatialMethods/sentinel_2/R20m/nhm/T30UXC_20250711T110651_B11_20m.tiff",
        "../data/SpatialMethods/sentinel_2/R20m/nhm/T30UXC_20250711T110651_B12_20m.tiff"
    ),
) / 10000

# Name the bands 
names(s2_nhm_20m) <- c("RE5", "RE6", "RE7", "NNIR", "SWIR1", "SWIR2")

# Show the resulting object structure
print(s2_silwood_10m)

print(st_layers("../data/SpatialMethods/Silmas_Fun_Run.gpx"))

silmas_route <- st_read(
  dsn="../data/SpatialMethods/Silmas_Fun_Run.gpx", layer="tracks"
)

plot(nest_boxes)

plot(nest_boxes['SPlocation'], key.pos=4)

# Get the plot extent as the union of the bounding boxes
plot_extent <- st_union(
  st_as_sfc(st_bbox(nest_boxes)),
  st_as_sfc(st_bbox(silmas_route))
)

# Plot the nest box points and overplot the Silmas route
plot(st_geometry(nest_boxes), col="forestgreen", extent=plot_extent)
plot(st_geometry(silmas_route), col="red", add=TRUE)

# Plot the 3 bands of the silwood aerial image
names(silwood_aerial) <- c("Red", "Green", "Blue")
plot(silwood_aerial, nc=3)

# Plot the silwood aerial data using the default settings
plotRGB(silwood_aerial)

# Plot the Sentinel data, setting the bands and scale
plotRGB(s2_silwood_10m, r=3, g=2, b=1, scale=0.80)

# Load the L2A TCI image for Silwood and plot using defaults.
s2_silwood_tci <- rast(
  "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_TCI_10m.tiff"
)
plotRGB(s2_silwood_tci)

# Plot the Sentinel data, setting the bands and scale
plotRGB(s2_silwood_10m, r=4, g=3, b=2, scale=0.8)

# Show the extent of the sensor locations in the current WGS84 projection
ext(sensor_locations)

# Convert the WGS84 vector datasets to BNG
sensor_locations <- st_transform(sensor_locations, crs="EPSG:27700")
nest_boxes <- st_transform(nest_boxes, crs="EPSG:27700")
silmas_route <- st_transform(silmas_route, crs="EPSG:27700")

# Show the new extent
ext(sensor_locations)

s2_nhm_10m_bng <- project(s2_nhm_10m, "EPSG:27700")
s2_nhm_10m <- project(s2_nhm_10m_bng, nhm_LCM, method = "cubic")

s2_silwood_10m <- project(s2_silwood_10m, silwood_LCM, method="cubic")
s2_nhm_10m <- project(s2_nhm_10m, nhm_LCM, method="cubic")

s2_silwood_20m_at_10m <- disagg(s2_silwood_20m, fact=2, method="bilinear")
s2_nhm_20m_at_10m <- disagg(s2_nhm_20m, fact=2, method="bilinear")

# Mosaic the two Terrain 5 panes into a single dataset
silwood_dtm <- mosaic(silwood_dtm_SU96NE, silwood_dtm_SU96NW)
nhm_dtm <- mosaic(nhm_dtm_TQ27NE, nhm_dtm_TQ28SE)

# Update the raster layer names
names(silwood_dtm) <- names(nhm_dtm) <- "Elevation"

# Combine the S2 10m bands with the resampled 20 m bands.
s2_silwood_10m <- c(s2_silwood_10m, s2_silwood_20m_at_10m)
s2_nhm_10m <- c(s2_nhm_10m, s2_nhm_20m_at_10m)

# Calculate the EVI index for the two sites
evi_nhm <- 2.5 * 
  (s2_nhm_10m[["NIR"]] - s2_nhm_10m[["R"]]) / 
  (s2_nhm_10m[["NIR"]] + 
    6 * s2_nhm_10m[["R"]] - 
    7.5 * s2_nhm_10m[["B"]] + 1)
  
evi_silwood <- 2.5 * 
  (s2_silwood_10m[["NIR"]] - s2_silwood_10m[["R"]]) / 
  (s2_silwood_10m[["NIR"]] + 
    6 * s2_silwood_10m[["R"]] - 
    7.5 * s2_silwood_10m[["B"]] + 1)

# Rename the single band 
names(evi_silwood) <- names(evi_nhm) <- "EVI"

# Remove anomalous EVI values
evi_nhm[evi_nhm > 1] <- NA
evi_nhm[evi_nhm < -1] <- NA

# Plot the EVI index data
par(mfrow=c(1, 1))
plot(evi_silwood)
plot(evi_nhm)

library(camtrapR)
