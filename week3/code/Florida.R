###### Florida Correlation Data ######
load("../data/KeyWestAnnualMeanTemperature.RData")

plot(ats) #Optional graph of Florida Mean Temperature

FloridaTempCorrelation <- cor(ats$Year, ats$Temp) #Calulates correlation of our data
FloridaTempCorrelation

###### Rudimentary P-Value Test ######
SampleCorrelation <- numeric(1000000) #Sample Vector of 1000000

for (i in 1:1000000) {
    SampleTemp <- sample(ats$Temp) #Takes a sample of the data temperatures
    SampleYear <- sample(ats$Year)
    SampleCorrelation[i] <- cor(SampleYear, SampleTemp) #correlates sample tempetature with random year and calulates correlation
}

Pvalue <- sum(abs(SampleCorrelation > FloridaTempCorrelation)) #Tests for any sample with greater correlation than data observed.
Pvalue
