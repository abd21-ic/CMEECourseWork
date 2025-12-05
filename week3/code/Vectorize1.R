# Author: An Dao (abd21@ic.ac.uk)
# Script: vectorize1.R
# Desc:   Script to compare the time taken to sum all elements of a matrix using loops vs vectorization.
# Date:   October 2025
#

# create a large matrix
M <- matrix(runif(1000000),1000,1000)

# function to sum all elements using loops
SumAllElements <- function(M) {
    Dimensions <- dim(M)
    Tot <- 0
    for (i in 1:Dimensions[1]) {
        for (j in 1:Dimensions[2]) {
            Tot <- Tot + M[i,j]
        }
    }
    return (Tot)
}

print("Using loops, the time taken is:")
print(system.time(SumAllElements(M)))

print("Using the in-built vectorized function, the time taken is:")
print(system.time(sum(M)))