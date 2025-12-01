# Week 1 Index

This week builds up confidence with Shellscripting, UNIX command line and terminal usage. Additionally, this is the first time we learn how to commit to GitHub.

## Assignment Tasks

### Task 1 — FASTA Exercise
**Files:**
* ../data/fasta/407228326.fasta
* ../data/fasta/407228412.fasta
* ../data/fasta/E.coli.fasta

**All of these tasks were answered in a text file:**
* UnixPrac1.txt



**Task Description:**

For this practical, we began to familiarise ourselves with shellscripting commands with fasta files.

---

### Task 2 — csv to space Excercise
**Files:**
* csvtospace.sh
* ../data/temperature/1800.csv
* ../data/temperature/1801.csv
* ../data/temperature/1802.csv
* ../data/temperature/1803.csv

**Task Description:**

For this practical, we wrote a shellscript that changed a .csv file to a space space separated values file that did not change the input file. It can handle wrong and missing inputs.

---

**Script Purpose:**
* csvtospace.sh

Changes .csv input file to space separated file, saves it in data/temperature and does not change the input file.

**Usage:** bash csvtospace.sh


---

### Task 3 — Improving scripts
**Files:**
* CountLines.sh
* ConcatenateTwoFiles.sh
* tiff2png.sh

**Description:**

For this practical, we made each script robust so it gives feedback to the user and exits if the right inputs are not provided.

---

**Script Purpose:**
* CountLines.sh

Counts the number of lines in an input file and exits if filename does not exist.

* ConcatenateTwoFiles.sh

Concatenates the content of two files. Exits if no file was found for either. Allows user to name the new combined file.

* tiff2png.sh

Converts a .tiff file into a .png file. Exits if the file does not match the .tif extension.

**Usage:**
* bash CountLines.sh
* bash ConcatenateTwoFiles.sh
* bash tiff2png.sh




## Non-Task Scripts

**All scripts are located in the code directory.**

---
* boilerplate.sh

Simple boilerplate template for creating shell scripts. Prints out "*This is a shell script!*".

**Usage:** bash boilerplate.sh

---
* MyExampleScript.sh

Shell script defines variables and prints to print messages to the terminal based on system username.

**Usage:** bash MyExampleScript.sh

---
* variables.sh

Shell script which performs basic arithmetic operations from inputs. Also does command substitution.

**Usage:** bash variables.sh 1 two

---
* CompileLaTeX.sh


Script which compiles *FirstExample.tex* and cleanups any auxillary files.

**Usage:** bash CompileLaTeX.sh FirstExample.tex


## Other Files

* FirstExample.tex

Latex file which has our first example of a latex document. Contains a standard template for scientific writing and has a reference.

---

* FirstBiblio.bib

Bibolography where the reference which *FirstExample.tex* calls on uses.

---

* FirstExample.pdf

Compiled .pdf file from the latex code *FirstExample.tex*.

---

* ../data/spawannxs.txt

This is a list of protected species of marine and coastal flora. This was used when using the *grep* terminal command.