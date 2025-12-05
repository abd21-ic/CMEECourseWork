# Author: An Dao (abd21@ic.ac.uk)
# Script: next.R
# Desc:   Script to illustrate the use of 'next' in R loops.
# Date:   October 2025
#

for (integer in 1:10) {
    if ((integer %% 2) == 0)
        next
    print(integer)
}