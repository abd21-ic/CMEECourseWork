# Week 3 Index

This week mainly focuses on R computing, involving handling datasets. Some scripts involve data wrangling and plotting.

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

## Non-Task Scripts

* apply1.R

R script that demonstrates the use of the apply function after creating a matrix.

**Usage:**

* Rscript apply1.R

---

* apply2.R

R script that demonstrates the use of the apply function after defining a function and applying it on the matrix.

**Usage:**

* Rscript apply2.R

---

* basic_io.R

R script that illustrates R input-output after importing `../data/trees.csv`.

**Usage:**

* Rscript basic_io.R

---

* boilerplate.R

Basic R script that defines a simple function and subsequently tests it.

**Usage:**

* Rscript boilerplate.R

---

* break.R

Basic R script that defines `integer` as `0` and loops until `integer` equals `10`. Illustrates the use of the `break` function.

**Usage:**

* Rscript browse.R

---

* control_flow.R

R script illustrates the control flow functions, "if-then", "else", and "for" and "while" loops.

**Usage:**

* Rscript control_flow.R

---

* DataWrang.R

R script which wrangles the Pound Hill dataset in `../data/PoundHillData.csv` and `../data/PoundHillMetaData.csv`. Cleans and transforms the Pound Hill dataset into a data frame for analysis and uses the `tidyverse` package in R.

**Usage:**

* Rscript DataWrang.R

---

* Girko.R

R script which plots Girko’s law simulation by building a function that calculate an eclipse. Plot written to `../results/Girko.pdf`.

**Usage:**

* Rscript Girko.R

---

* MyBars.R

R script that creates a bar chart plot using the `ggplot2` package, with data from `../data/Results.txt` and saves the final figure as a `.pdf` in `../results/MyBars.pdf`.

**Usage:**

* Rscript MyBars.R

---

* next.R

R script that illustrates the use of `next` in loops by skipping all even numbers between 1 and 10.

**Usage:**

* Rscript next.R

---

* plotLin.R

R script that generates a linear regression plot with a regression line and posts the plot to `../results/MyLinReg.pdf`.

**Usage:**

* Rscript plotLin.R

---

* preallocate.R

R script which compares the performance of vector creation with and without preallocation by timing two functions.

**Usage:**

* Rscript preallocate.R

---

* R_conditionals.R

R script which has three functions to illustrate conditionals:

1. Function to check if a number is even or odd.
2. Function to check if a number is a power of 2.
3. Function to check if a number if a prime, composite, unit or 0.

**Usage:**

* Rscript R_conditionals.R

---

* Ricker.R

R script that runs a simulation of the Ricker model and plots the output.

**Usage:**

* Rscript Ricker.R

---

* sample.R

R script that compares multiple methods for repeatedly sampling from a population:

1. For-loop without preallocation.
2. For-loop with preallocation.
3. For-loop with preallocated list.
4. Vectorized sampling using `lapply()`.
5. Vectorized sampling using `sapply()`.

**Usage:**

* Rscript sample.R

---

* try.R

R script that samples repeatedly from a population and uses `try()` to catch cases where the sample has too few unique values, and stores the results using both `lapply` and a manual loop.

**Usage:**

* Rscript try.R

---

* vectorize1.R

R script that compares the time taken to sum all elements of a matrix using loops vs vectorisation.

**Usage:**

* Rscript vectorize1.R