# Author: An Dao (abd21@ic.ac.uk)
# Script: apply1.R
# Desc:   Demonstrate the use of apply function in R
# Date:   October 2025
#

# create a matrix and apply the custom function to each row
M <- matrix(rnorm(100),10,10)

# calculate the mean and variance for each row and column
RowMeans <- apply(M, 1, mean)
print(RowMeans)

# calculate variance for each row
RowVars <- apply (M, 1, var)
print (RowVars)

# calculate mean for each column
ColMeans <- apply(M,2,mean)
print(ColMeans)