# Author: An Dao (abd21@ic.ac.uk)
# Script: browse.R
# Desc:   Script to illustrate the use of browser() in R.
# Date:   October 2025
#


Exponential <- function(N0 = 1, r = 1, generations = 10) {
  # Runs a simulation of exponential growth
  # Returns a vector of length generations
  # Creates a vector of NA
  
  N <- rep(NA, generations)
  
  # initialize first element
  N[1] <- N0
  for (t in 2:generations) {
    N[t] <- N[t-1] * exp(r)
    browser()
  }
  return (N)
}

# plot the results
plot(Exponential(), type="l", main="Exponential growth")