# Author: An Dao (abd21@ic.ac.uk)
# Script: control_flow.R
# Desc:   Script to illustrate control flow in R.
# Date:   October 2025
#

# If-else statement
a <- TRUE
if (a == TRUE) {
    print ("a is TRUE")
} else {
    print ("a is FALSE")
}

# Generate a random number and use if statement
z <- runif(1) ## Generate a uniformly distributed random number
if (z <= 0.5) {print ("Less than a half")}

# For loop examples
for (i in seq(10)) {
    j <- i * i
    print(paste(i, " squared is", j ))
}

# Looping through a vector
for(species in c('Heliodoxa rubinoides', 
                 'Boissonneaua jardini', 
                 'Sula nebouxii')) {
      print(paste('The species is', species))
}

# While loop examples
v1 <- c("a","bc","def")
for (i in v1) {
    print(i)
}

# Print squares of numbers from 1 to 10
i <- 0
while (i < 10) {
    i <- i+1
    print(i^2)
}
