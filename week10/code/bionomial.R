# Load required packages
library(MASS)
library(dplyr)
library(lme4)


# Read the data
model <- read.csv("../results/binary_muntiacus_with_e.csv", stringsAsFactors = FALSE)

# Ensure variables have correct types
model$Muntiacus_present <- as.numeric(model$Muntiacus_present)
model$EVI_Silwood <- as.numeric(model$EVI_Silwood)
model$Station <- as.factor(model$Station)  # Treat Station as categorical
model <- model[model$Station != "63", ]


nb_model <- glm(Muntiacus_present ~ EVI_Silwood, data = model, family = "binomial")

# Summarize the model
summary(nb_model)


# Fit a GLMM with Station as a random effect
glmm_model <- glmer(
  Muntiacus_present ~ EVI_Silwood + (1 | Station), 
  data = model,
  family = binomial(link = "logit")
)

# Summarize the model
summary(glmm_model)

anova(glmm_model, test = "Chisq")

#install.packages("ggeffects")  # Uncomment if ggeffects is not installed
library(ggeffects)
library(ggplot2)


pred <- ggpredict(glmm_model, terms = c("EVI_Silwood [all]"))

# Plot observed points (jittered) + predicted sigmoid curve
ggplot() +
  # Observed 0/1 points
  geom_jitter(
    data = model,
    aes(x = EVI_Silwood, y = Muntiacus_present),
    width = 0.02, height = 0, alpha = 0.1, color = "black"
  ) +
  # Predicted probability curve
  geom_line(
    data = pred,
    aes(x = x, y = predicted),
    color = "black", size = 1
  ) +
  # 95% confidence interval
  geom_ribbon(
    data = pred,
    aes(x = x, ymin = conf.low, ymax = conf.high),
    alpha = 0.2, fill = "black"
  ) +
  labs(
    title = "Predicted Probability of Muntiacus Presence vs EVI (Silwood)",
    x = "EVI (Silwood)",
    y = "Predicted Probability"
  ) +
  theme_minimal()
