# Author: An Dao (abd21@ic.ac.uk)
# Script: boilerplate.R
# Desc:   Simple R boilerplate template.
# Date:   October 2025
#

# Define a simple function
my_function <- function(Arg1, Arg2) {
    print(paste("Argument", as.character(Arg1), "is a", class(Arg1)))
    print(paste("Argument", as.character(Arg2), "is a", class(Arg2)))
    return(c(Arg1, Arg2))
}

# Test the function
my_function(1,2)
my_function("Riki", "Tiki")