# Author: An Dao (abd21@ic.ac.uk)
# Script: try.R
# Desc:   Script to demonstrate the use of try() in R.
# Date:   October 2025
#

# function that samples with replacement from a vector "x" and calculates the mean
doit <- function(x) {
    temp_x <- sample(x, replace = TRUE)
    if(length(unique(temp_x)) > 30) {
         print(paste("Mean of this sample was:", as.character(mean(temp_x))))
        } 
    else {
        stop("Couldn't calculate mean: too few unique values!")
        }
    }

set.seed(1345)

# generate a population with only 50 values
popn <- rnorm(50)

# generate a histogram of the population
hist(popn)

# run the function 15 times, using try() to catch any errors
#lapply(1:15, function(i) doit(popn)) # this will stop if an error occurs so has been commented out

result <- lapply(1:15, function(i) try(doit(popn), FALSE))

class(result)

# alternative way to store the results
result <- vector("list", 15)
for(i in 1:15) {
    result[[i]] <- try(doit(popn), FALSE)
    }