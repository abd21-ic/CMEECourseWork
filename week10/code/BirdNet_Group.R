#install.packages("birdnetR")

library(birdnetR)

# Initialise a BirdNET model
model <- birdnet_model_tflite("v2.4")

## First run Group 6
# Set path to the folder with WAV files
folder_path <- "../data/Group6_Oct9"

# List all WAV files
wav_files <- list.files(folder_path, pattern = "\\.wav$", full.names = TRUE)


#If you want to predict based on a specific location
# Your site coordinates (same for all files)
lat  <- 51.407777     # <- change to your latitude
long <- -0.646617     # <- change to your longitude

group6_predictions <- lapply(wav_files, function(f) {
  preds <- predict_species_from_audio_file(model, f)
  # Add filename + coordinates as new columns
  preds$file      <- basename(f)
  preds$latitude  <- lat
  preds$longitude <- long
  preds
})
# Combine into one data frame
group6_predictions_df <- do.call(rbind, group6_predictions)

## Now run Group 4
# Path to the folder with WAV files
folder_path <- "../data/Group4_Oct9"

# List all WAV files
wav_files <- list.files(folder_path, pattern = "\\.wav$", full.names = TRUE)

#If you want to predict based on a specific location
# Your site coordinates (same for all files)
lat  <- 51.407777     # <- change to your latitude
long <- -0.645094     # <- change to your longitude

group_4_all_predictions <- lapply(wav_files, function(f) {
  preds <- predict_species_from_audio_file(model, f)
  # Add filename + coordinates as new columns
  preds$file      <- basename(f)
  preds$latitude  <- lat
  preds$longitude <- long
  preds
})

# Combine into one dataframe
group_4_predictions_df <- do.call(rbind, group_4_all_predictions)

#set your wd and save the files
setwd("../results/BirdNET")
write.csv(group6_predictions_df, "Group6_Oct9.csv")
write.csv(group_4_predictions_df, "Group4_Oct9.csv")
