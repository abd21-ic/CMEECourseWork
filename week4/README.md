# Week 4 Index

This week was mainly focused on R scripting, so the files have been included in `../week3`. We also briefly touched upon Biological Computing in Python.

## Scripts

* profileme.py

Python script that generates a list of squared numbers and repeatedly joins a string. Used to locate bottlenecks in the script.

**Usage:**

* python3 profileme.py

---

* profileme2.py

Python script that generates a list of squared numbers and repeatedly joins a string. Similar to `profileme.py` except the loop is a list comprehension, and the `.join` is replaced with an explicit string concatenation,

**Usage:**

* python3 profileme2.py

---

* timeitme.py

Compares the performance of functions in `profileme.py` versus `profileme2.py`.

**Usage:**

* python3 timeitme.py