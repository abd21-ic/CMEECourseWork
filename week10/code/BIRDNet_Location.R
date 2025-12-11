############################################################
# BirdNETR – batch audio + site meta, with RESTRICTED list
#
# Output:
# 1) audio_all.csv
#      - all audio detections (start, end, species, file, lat/long)
# 2) audio_restricted.csv
#      - same as above, but ONLY species in the meta (site) list
# 3) site_species.csv
#      - site species list from meta model
############################################################

# --- 0. Packages -----------------------------------------------------------

# install.packages("birdnetR")
# install.packages("tidyr")

library(birdnetR)
library(tidyr)

# --- 1. settings ------------------------------------------------------

# Folder containing the WAV files
folder_path <- "../data/Group4_Oct9"

# Site coordinates for this batch
lat  <- 51.407777     # <- change to your latitude
long <- -0.646617     # <- change to your longitude

# Output files
audio_all_csv        <- "../results/audio_predictions_all.csv"
audio_restricted_csv <- "../results/audio_predictions_restricted.csv"
site_species_csv     <- "../results/site_species.csv"

# --- 2. Load models --------------------------------------------------------

# Audio model – works on WAV files
audio_model <- birdnet_model_tflite("v2.4")

# Meta model – works on location/time
meta_model  <- birdnet_model_meta("v2.4")

# --- 3. META: species expected at this site --------------------------------

site_raw <- predict_species_at_location_and_time(
  meta_model,
  latitude  = lat,
  longitude = long
)

# site_raw has: label (e.g. "Columba palumbus_Common Wood-Pigeon"), confidence

site_species <- separate(
  site_raw,
  col   = label,
  into  = c("scientific_name", "common_name"),
  sep   = "_",
  remove = TRUE
)

# Keep just what we need and rename confidence
site_species <- site_species[, c("scientific_name", "common_name", "confidence")]
names(site_species)[3] <- "site_confidence"

# Add coords for reference and save
site_species$latitude  <- lat
site_species$longitude <- long

write.csv(site_species, site_species_csv, row.names = FALSE)

# Also keep a version WITHOUT lat/long for joining later
site_species_join <- site_species[, c("scientific_name", "common_name", "site_confidence")]

# --- 4. AUDIO: predictions for every WAV in the folder ---------------------

wav_files <- list.files(
  folder_path,
  pattern    = "\\.wav$",
  full.names = TRUE
)

all_audio_predictions <- lapply(wav_files, function(f) {
  
  preds <- predict_species_from_audio_file(audio_model, f)
  
  # Add filename + site coords
  preds$file      <- basename(f)
  preds$latitude  <- lat
  preds$longitude <- long
  
  preds
})

audio_predictions_df <- do.call(rbind, all_audio_predictions)

# This has: start, end, scientific_name, common_name,
#           confidence, file, latitude, longitude

write.csv(audio_predictions_df, audio_all_csv, row.names = FALSE)

# --- 5. RESTRICT audio predictions to species in meta list -----------------

# Join on scientific + common name.
# This keeps ONLY rows where the species is in the meta list
# and adds the meta "site_confidence" column.

audio_restricted <- merge(
  audio_predictions_df,
  site_species_join,
  by   = c("scientific_name", "common_name"),
  all.x = FALSE,    # drop audio rows whose species are NOT in site list
  all.y = FALSE     # we don't need unused site species
)

# Columns now include:
# scientific_name, common_name, start, end, confidence (audio),
# file, latitude, longitude, site_confidence (meta)

write.csv(audio_restricted, audio_restricted_csv, row.names = FALSE)

# --- 6. Done ---------------------------------------------------------------

cat("✅ All audio predictions  -> ", audio_all_csv, "\n")
cat("✅ Restricted predictions -> ", audio_restricted_csv, "\n")
cat("✅ Site species list      -> ", site_species_csv, "\n")
