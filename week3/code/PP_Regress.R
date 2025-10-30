library(tidyverse)

my_data <- read.csv("../data/EcolArchives-E089-51-D1.csv")

p <- ggplot(my_data,
            aes(Prey.mass, Predator.mass,
                color = Predator.lifestage))

p <- p + geom_point(shape = I(3)) + geom_smooth(method = "lm", fullrange = TRUE) +
  scale_x_log10() + scale_y_log10()

p <- p + facet_wrap(Type.of.feeding.interaction ~., ncol = 1, strip.position = "right") +
  labs(x = "Prey mass in grams", y = "Predator mass in grams") +
  theme(
    legend.position = "bottom",
    legend.direction = "horizontal",
    legend.box = "horizontal",
    strip.placement = "outside",
    plot.margin = margin(10, 40, 10, 10),
    legend.text = element_text(size = 8),
    legend.title = element_text(size = 9),
    strip.text = element_text(size = 8)
  ) +
  guides(color = guide_legend(nrow = 1))
print(p)

regs <- my_data %>%
  group_by(Type.of.feeding.interaction, Predator.lifestage) %>%
  summarise({
    model <- lm(log(Predator.mass) ~ log(Prey.mass), data = cur_data())
    fpstats <- summary(model)
    
    fstat <- fpstats$fstatistic
    
    if (!is.null(fstat) && all(is.finite(fstat))) {
      p_val <- pf(fstat[1], fstat[2], fstat[3], lower.tail = FALSE)
    } else {
      p_val <- NA_real_
    }
    
    tibble(
      slope = coef(model)[2],
      intercept = coef(model)[1],
      R = sqrt(fpstats$r.squared),
      F_stat = if (!is.null(fstat)) fstat[1] else NA_real_,
      p_value = p_val
    )
  }, .groups = "drop")

write.csv(regs, "../results/PP_Regress_Results.csv", row.names = FALSE)
