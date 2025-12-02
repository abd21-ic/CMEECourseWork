# Week 3 Index

This week mainly focuses on R computing, involving handling datasets.

## Assignment Tasks

### Task 1 — Oaks Data
**Files:**
* TreeHeight.R
* ../data/trees.csv


**Task Description:**
Modification of the `TreeHeight.R` taken from *TheMulQuaBio* repo and create a `.csv` file in the `results` dictionary.

---

**Script Purpose:**
* TreeHeight.R

R script which has a function which calculates heights of trees given distance of each tree from base and angle to its top, using trig formula `height = distance * tan(radians)`. Reads from `../data/trees.csv` and writes to `../results/TreeHts.csv`.

**Usage:**
* Rscript TreeHeight.R

---

### Task 2 — Florida Temperature
**Files:**
* Florida.R
* ../data/KeyWestAnnualMeanTemperature.RData


**Task Description:**
To answer the question *Is Florida getting warmer?* we created an R script that correlates mean temperature data from Florida and performed a rudimentary p-value test.

---

**Script Purpose:**
* Florida.R

R script which imports `../data/KeyWestAnnualMeanTemperature.RData`, calulates a correlation. It then creates 1,000,000 sample correlations from the years and mean yearly temperature included in the `.RData`. We then create a histogram with our sample correlations and see how many correlations exceeded our calulated correlation, calulating a rudimentary p-value from this.

**Usage:**
* Rscript Florida.R

---

### Task 3 - Regression

**Files:**
* PP_Regress.R
* ../data/EcolArchives-E089-51-D1.csv

**Task Description:**
We write an R script that draws and saves a `.pdf` file, and writes the accompanying regression results to a formatted table in `.csv`.

---

**Script Purpose:**
* PP_Regress.R

R script which imports `../data/EcolArchives-E089-51-D1.csv`. It creates `../results/PP_Regress_Figure.pdf` which has figures on predator and prey mass relationships for various groups. We further create `../results/PP_Regress_Results.csv` that stores the regression results, F-statistic and p-value.

**Usage:**
* Rscript PP_Regress.R

---