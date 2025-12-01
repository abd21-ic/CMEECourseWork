# Week 2 Index

This week mainly focuses on Python coding, from the assigning values to variables to writing python programs and debugging.

## Assignment Tasks

### Task 1 — Loops and lists Comprehension
**Files:**
* lc1.py
* lc2.py
* dictionary.py
* tuple.py


**Task Description:**
These programs were fetched from the *TheMulQuaBio* repo and edited depending on the comments within the scripts.

---

**Script Purpose:**
* lc1.py

Python script which writes three separate lists containing latin names, common names and mean body masses for each species in bird that we already have in the Python script. Does this twice, using list comprehensions and conventional loops.

* lc2.py

Python script which writes two lists of months where rainfall exceeds 100mm and 50mm based on the data already in the Python script. Does this twice, using list comprehensions and conventional loops.

* dictionary.py

Python script which populates a dictionary called taxa_dic (created locally). Orders the names into sets of taxa and prints. Does this twice, using convetional loops and list comprehensions.

* tuple.py

Python script which prints birds within the script (a tuple of tuples) line by line with their Latin name, common name and mass.

**Usage:**
* python3 tuple.py
* python3 lc2.py
* python3 dictionary.py
* python3 tuple.py

---

### Task 2 — Writing a program with control flows
**Files:**
* cfexercises1.py

**Task Description:**

`cfexercises1.py` was a script that was given to us in *TheMulQuaBio* repo. We had to modify it to make it like a module, so that it would take arguements from the user (such as `foo_1(9)`). Test arguments have been provided to output the evaluations of all `foo_x` functions.

---

**Script Purpose:**
* cfexercises1.py

Python script with six functions (`foo_x`).

1. `foo_1` square roots the argument.
2. `foo_2` takes two arugments and compares to see which one is greater (or equal).
3. `foo_3` takes three arugments and prints the arguments into ascending order. Prints out the swaps.
4. `foo_4` factorises the arugment.
5. `foo_5` factorises the arugment.
5. `foo_6` factorises the arugment.

**Usage:**
* python3 cfexercises1.py


---

### Task 3 — Missing oaks problem
**Files:**
* oaks_debugme.py
* ../data/TestOaksData.csv

**Task Description:**

For this practical, we took `oaks_debugme.py` and `TestOaksData.csv` from the *TheMulQuaBio* repo. We fixed the function to check if a species belongs to genus "Quercus". Modified to also handle cases when there is a typo or close enough to "Quercus".

---

**Script Purpose:**
* oaks_debugme.py

Checks `../data/TestOaksData.csv` for any species entries under the genus "Quercus". Accepts any entry that is 80% similar to "Quercus". Prints "FOUND AN OAK!" when a "Quercus" is found and writes to `../results/JustOaksData.csv`.

**Usage:**
* python3 oaks_debugme.py

---

### Task 4 — Align DNA sequences
**Files:**
* align_seqs.py
* ../data/combined_file.csv

**Task Description:**

For this practical, we took `align_seqs.py` from the *TheMulQuaBio* repo and converted it so it takes an input from a single external file and saves the best alignment and its corresponding score into a single text file.

---

**Script Purpose:**
* align_seqs.py

Aligns two DNA sequences from a single external data file (in our case `../data/combined_file.csv`) and outputs the best alignment with corresponding scores in `../results/score.txt`.

**Usage:**
* python3 oaks_debugme.py




## Non-Task Scripts

* basic_csv.py

Reads `../data/testcsv.csv` and writes a file containing species name and body mass in `../results/bodymass.csv` from the original `.csv` file.

**Usage:**

* python3 oaks_debugme.py

---

* basic_io1.py

Basic python script which opens `../sandbox/test.txt` for basic importing and exporting data in python. **Script is commented out as `sandbox` directory is not uploaded to GitHub.**

**Usage:**

* python3 basic_io1.py

---

* basic_io2.py

Basic python script which opens `../sandbox/test.txt` and writes 0 to 99 on separate lines. **Script is commented out as `sandbox` directory is not uploaded to GitHub.**

**Usage:**

* python3 basic_io2.py

---

* basic_io3.py

Basic python script which saved a python dictionary to a binary file in the `sandbox` directory using `pickle` and load it back later. **Script is commented out as `sandbox` directory is not uploaded to GitHub.**

**Usage:**

* python3 basic_io3.py

---

* boilerplate.py

Basic python script which prints "This is a boilerplate". Contains the template used for docstrings and preamble.

**Usage:**

* python3 boilerplate.py

---

* cfexercises2.py

Python script which has six functions:

1. `hello_1` prints "hello" every time a number from `0` to `x-1` is divisible by 3.
2. `hello_2` prints "hello" for numbers from `0` to `x-1` when the number mod 5 equals 3, or the number mod 4 equals 3.
3. `hello_3` prints "hello" for the difference from `x` to `y-1`.
4. `hello_4` prints "hello" and adds 3 to `x` until `x` equals 15.
5. `hello_5` counts from `x` to 99 and prints "hello" when `x` is 18 (one "hello") or when `x` is 31 (seven "hello").
6. `hello_6` prints "hello" and the value of `y` when `x` is True until `y` equals six.

**Usage:**

* python3 cfexercises2.py


---

* control_flow.py

Python program which has many functions including checking whether a number is even or odd. This was part of writing a python program.

**Usage:**

* python3 debugme.py

---

* debugme.py

Python program which has an error for debugging. **Commented out as it would cause a script error (ZeroDivisionError).**

**Usage:**

* python3 debugme.py

---

* loops.py

Basic python script which has `for` and `while` loops.

**Usage:**

* python3 loops.py

---

* myexamplescript.py

Basic python script (the first one for this coursework) has one function `foo` and prints out `foo(2)`.

**Usage:**

* python3 myexamplescript.py

---

* oaks.py

Basic python script which finds taxa that are oak trees from a list of species in the script

**Usage:**

* python3 oaks.py

---

* scope.py

Python script which illustrates variable scope. Designates certain variables to be global so that they visible both inside and outside of functions in python.

**Usage:**

* python3 scope.py

---

* sysargv.py

Simple python script which prints the name of the script, the total number of arguments passed and lists all arguments as a list.

**Usage:**

* python3 sysargv.py

---

* test_control_flow.py

Similar to `control_flow.py` except this was modified to try unit testing with `doctest`.

**Usage:**

* python3 test_control_flow.py

---

* tuple.py

Basic python script with a tuple of birds that prints out the Latin name, common name and the mass.

**Usage:**

* python3 tuple.py

---

* using_name.py

Basic python script which demonstrates the use of `__name__`.

**Usage:**

* python3 using_name.py


## Other Files

* ../data/testcsv.csv

`.csv` file used for the `basic_csv.py` containing species, infraorder, family, distribution and male body mass.

---

* ../data/407228326.csv
* ../data/407228412.csv

Original `.csv` files combined for the `combined_file.csv` using the terminal.