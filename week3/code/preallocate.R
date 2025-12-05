# Author: An Dao (abd21@ic.ac.uk)
# Script: preallocate.R
# Desc:   Script to illustrate preallocation in R loops.
# Date:   October 2025
#

# Function without preallocation
NoPreallocFun <- function(x) {
    a <- vector()
    for (i in 1:x) {
        a <- c(a,i)
        #print(a)
        #print(object.size(a))
    }
}

# Measure time taken for function without preallocation
system.time(NoPreallocFun(1000))

# Function with preallocation
PreallocFun <- function(x) {
    a <- rep(NA, x)
    for (i in 1:x) {
        a[i] <- i
        #print(a)
        #print(object.size(a))
    }
}

# Measure time taken for function with preallocation
system.time(PreallocFun(1000))