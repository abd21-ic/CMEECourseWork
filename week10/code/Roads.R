#install.packages(c("terra", "sf", "rcartocolor", "rpart"))

library(terra)       # core raster GIS package
library(sf)          # core vector GIS package
library(rcartocolor) # plotting
library(rpart)

# -------------------------------
# 1️⃣ Load CSV sensor locations
# -------------------------------
sensor_locations <- read.csv("../data/sensor/sensor_sites_2025.csv")

# Convert to sf object
sensor_locations <- st_as_sf(
  sensor_locations, 
  coords=c("long_Sensor_location","lat_Sensor_location"),
  crs="EPSG:4326"
)

# -------------------------------
# 3️⃣ Load raster datasets
# -------------------------------
nhm_aerial <- rast('../data/SpatialMethods/aerial/nhm_aerial.tiff')
silwood_aerial <- rast('../data/SpatialMethods/aerial/silwood_aerial.tiff')

# DTM rasters
silwood_dtm_SU96NE <- rast("../data/SpatialMethods/dtm_5m/SU96NE.asc")
silwood_dtm_SU96NW <- rast("../data/SpatialMethods/dtm_5m/SU96NW.asc")
nhm_dtm_TQ27NE <- rast("../data/SpatialMethods/dtm_5m/TQ27NE.asc")
nhm_dtm_TQ28SE <- rast("../data/SpatialMethods/dtm_5m/TQ28SE.asc")

# Set CRS
crs(silwood_dtm_SU96NE) <- crs(silwood_dtm_SU96NW) <- "EPSG:27700"
crs(nhm_dtm_TQ27NE) <- crs(nhm_dtm_TQ28SE) <- "EPSG:27700"

# Land cover maps
silwood_LCM <- rast("../data/SpatialMethods/lcm_2024/Silwood_LCM2024.tiff")
nhm_LCM <- rast("../data/SpatialMethods/lcm_2024/NHM_LCM2024.tiff")

lcm_info <- read.csv("../data/SpatialMethods/lcm_2024/LCM2024_info.csv")
levels(nhm_LCM) <- lcm_info[c("value", "label")]
coltab(nhm_LCM) <- lcm_info[c("value", "color")]
names(nhm_LCM) <- c("LandCover", "Certainty")

coltab(silwood_LCM) <- lcm_info[c("value", "color")]
levels(silwood_LCM) <- lcm_info[c("value", "label")]
names(silwood_LCM) <- c("LandCover", "Certainty")

# -------------------------------
# 4️⃣ Load VML road layers
# -------------------------------
vml_tq28se_roads <- st_read("../data/SpatialMethods/VML/vml-tq28se.gpkg", layer="Road_Centreline")
vml_tq27ne_roads <- st_read("../data/SpatialMethods/VML/vml-tq27ne.gpkg", layer="Road_Centreline")
vml_su96ne_roads <- st_read("../data/SpatialMethods/VML/vml-su96ne.gpkg", layer="Road_Centreline")
vml_su96nw_roads <- st_read("../data/SpatialMethods/VML/vml-su96nw.gpkg", layer="Road_Centreline")

# Combine all roads
all_roads <- rbind(vml_tq28se_roads, vml_tq27ne_roads, vml_su96ne_roads, vml_su96nw_roads)

# -------------------------------
# Load Silwood Sentinel 10m raster
# -------------------------------
s2_silwood_10m <- rast(c(
    "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B02_10m.tiff",
    "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B03_10m.tiff",
    "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B04_10m.tiff",
    "../data/SpatialMethods/sentinel_2/R10m/silwood/T30UXC_20250711T110651_B08_10m.tiff"
)) / 10000
names(s2_silwood_10m) <- c("B","G","R","NIR")

# -------------------------------
# Load road vector and transform
# -------------------------------
vml_su96ne_roads <- st_read("../data/SpatialMethods/VML/vml-su96ne.gpkg", layer="Road_Centreline")
vml_su96nw_roads <- st_read("../data/SpatialMethods/VML/vml-su96nw.gpkg", layer="Road_Centreline")
all_roads <- rbind(vml_su96ne_roads, vml_su96nw_roads)
all_roads <- st_transform(all_roads, crs(crs(s2_silwood_10m)))

# Convert to SpatVector for terra
road_vect <- vect(all_roads)

# -------------------------------
# Create an empty raster matching Sentinel 10m
# -------------------------------
template_raster <- rast(ext(s2_silwood_10m), 
                        resolution=res(s2_silwood_10m), 
                        crs=crs(s2_silwood_10m))

# -------------------------------
# Compute distance raster
# -------------------------------
dist_to_road <- distance(template_raster, road_vect)

# -------------------------------
# Plot
# -------------------------------
plot(dist_to_road, main="Distance to Road (Silwood 10m)")


all_roads <- st_transform(all_roads, crs = st_crs(sensor_locations))

# -------------------------------
# 3️⃣ Compute distance from each sensor to nearest road
# -------------------------------
# st_distance returns a matrix of distances between each point and each road feature
dist_matrix <- st_distance(sensor_locations, all_roads)

# For each sensor, take the minimum distance
sensor_locations$distance_to_road_m <- apply(dist_matrix, 1, min)

# -------------------------------
# 4️⃣ Inspect results
# -------------------------------
print(sensor_locations)

hist(sensor_locations$distance_to_road_m,
     main = "Histogram of Distance to Road",
     xlab = "Distance (m)",
     col = "lightblue",
     breaks = 20)


