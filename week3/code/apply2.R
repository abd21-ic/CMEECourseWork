# Author: An Dao (abd21@ic.ac.uk)
# Script: apply2.R
# Desc:   Demonstrate the use of apply function with custom function in R
# Date:   October 2025
#

# define a custom function to apply
SomeOperation <- function(v) {
    if (sum(v) > 0) {
        return (v * 100)
    } else {
        return(v)
    }
}

# create a matrix and apply the custom function to each row 
M <- matrix(rnorm(100),10,10)
print(apply(M, 1, SomeOperation))