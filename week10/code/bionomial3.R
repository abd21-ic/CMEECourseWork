# Load required packages
library(dplyr)

# clear workspace
rm(list = ls())

# Read the data
model <- read.csv("../results/binary_muntiacus_with_e.csv", stringsAsFactors = FALSE)
model <- model[model$Station != "63", ]

station_occupancy <- model %>%
    group_by(EVI_Silwood) %>%
    summarise(occupancy_rate = mean(Muntiacus_present, na.rm = TRUE))

lm_model <- lm(occupancy_rate ~ EVI_Silwood, data = station_occupancy)
summary(lm_model)

# Mean of EVI
mean_EVI <- mean(model$EVI_Silwood, na.rm = TRUE)

# Range of EVI
range_EVI <- range(model$EVI_Silwood, na.rm = TRUE)

# Standard deviation of EVI
sd_EVI <- sd(model$EVI_Silwood, na.rm = TRUE)

mean_EVI
range_EVI
sd_EVI

mean_occ <- mean(station_occupancy$occupancy_rate, na.rm = TRUE)

# Range of occupancy rate
range_occ <- range(station_occupancy$occupancy_rate, na.rm = TRUE)

# Standard deviation of occupancy rate
sd_occ <- sd(station_occupancy$occupancy_rate, na.rm = TRUE)

mean_occ
range_occ
sd_occ



par(mfrow = c(2, 2))
plot(lm_model)

library(ggplot2)

p <- ggplot(station_occupancy, aes(x = EVI_Silwood, y = occupancy_rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, col = "black") +
  labs(y = "Muntjac site encounter rate", x = "EVI")

scale_model <- scale(model$EVI_Silwood)

pdf("../results/occupancy_vs_EVI.pdf", width = 6, height = 5)
print(p)
dev.off()

hist(model$EVI_Silwood,
     main = "Histogram of Distance to Road",
     xlab = "EVI",
     col = "lightblue",)
