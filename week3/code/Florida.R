# Author: An Dao (abd21@ic.ac.uk)
# Script: Florida.R
# Desc:   Correlation test of Florida annual mean temperature data
# Date:   October 2025
#

###### Florida Correlation Data ######
load("../data/KeyWestAnnualMeanTemperature.RData")

plot(ats) #Optional graph of Florida Mean Temperature

FloridaTempCorrelation <- cor(ats$Year, ats$Temp) #Calulates correlation of our data
FloridaTempCorrelation

###### Rudimentary p-value Test ######
SampleCorrelation <- numeric(1000000) #Sample Vector of 1000000

for (i in 1:1000000) {
    SampleTemp <- sample(ats$Temp) #Takes a sample of the data temperatures
    SampleYear <- sample(ats$Year)
    SampleCorrelation[i] <- cor(SampleYear, SampleTemp) #correlates sample tempetature with random year and calulates correlation
}

hist(SampleCorrelation)

Pvalue <- sum(abs(SampleCorrelation > FloridaTempCorrelation)) #Tests for any sample with greater correlation than data observed.
Pvalue
