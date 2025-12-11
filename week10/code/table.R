library(dplyr)
library(lubridate)

# Read the merged CSV
output_file_3 <- read.csv("../results/merged_tables_update.csv", stringsAsFactors = FALSE)

# Standardize the Date column
output_file_3$Date_parsed <- as.Date(parse_date_time(output_file_3$Date, orders = c("ymd", "dmy")))

# Remove rows for 2025-06-20
output_file_3 <- output_file_3 %>%
  filter(Date_parsed != as.Date("2025-06-20"))

# Get all unique Stations and all unique Dates
all_stations <- unique(output_file_3$Station)
all_dates <- unique(output_file_3$Date_parsed)

# Create full Station × Date grid
full_grid <- expand.grid(Station = all_stations, Date_parsed = all_dates)

# Calculate Muntiacus presence per Station per Date
binary_muntiacus <- output_file_3 %>%
  group_by(Station, Date_parsed) %>%
  summarize(Muntiacus_present = ifelse(any(Species == "Muntiacus_reevesi"), 1, 0), .groups = "drop")

# Merge with the full grid to fill in zeros where no data
binary_muntiacus_complete <- full_grid %>%
  left_join(binary_muntiacus, by = c("Station", "Date_parsed")) %>%
  mutate(Muntiacus_present = ifelse(is.na(Muntiacus_present), 0, Muntiacus_present)) %>%
  arrange(Station, Date_parsed)

head(binary_muntiacus_complete, 100)

# Or, if you want to see all rows in a tibble format
library(tibble)
as_tibble(binary_muntiacus_complete)

write.csv(binary_muntiacus_complete, "../results/binary_muntiacus_complete.csv", row.names = FALSE)

sensor_evi_df <- read.csv("../results/sensor_evi_silwood.csv", stringsAsFactors = FALSE)

# Ensure both Station columns are character
binary_muntiacus_complete$Station <- as.character(binary_muntiacus_complete$Station)
sensor_evi_df$Station <- as.character(sensor_evi_df$Station)


binary_muntiacus_complete$Station[binary_muntiacus_complete$Station == "26"] <- "18"
binary_muntiacus_complete$Station[binary_muntiacus_complete$Station == "30"] <- "13"

# Verify the change
table(binary_muntiacus_complete$Station)

# Merge EVI into the binary_muntiacus_complete table by Station
binary_muntiacus_with_evi <- binary_muntiacus_complete %>%
  left_join(sensor_evi_df, by = c("Station"))

# Optional: check results
head(binary_muntiacus_with_evi)

output_file <- "../results/binary_muntiacus_with_e.csv"

write.csv(binary_muntiacus_with_evi, file = output_file, row.names = FALSE)
