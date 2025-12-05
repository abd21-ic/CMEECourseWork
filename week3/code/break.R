# Author: An Dao (abd21@ic.ac.uk)
# Script: break.R
# Desc:   Script showing the use of break in R loops.
# Date:   October 2025
#

# integer
integer <- 0

# loop with break
while (integer < Inf) {
    if (integer == 10 ) {
        break
    } else {
        cat("integer equals ", integer , " \n")
        integer <- integer + 1
    }
}