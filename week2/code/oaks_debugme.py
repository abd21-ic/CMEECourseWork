__appname__ = 'oaks_debugme.py'
__author__ = 'An Dao (abd21@ic.ac.uk)'
__version__ = '0.0.1'

import csv
import sys
import os
import difflib

#checks if species belongs to genus "Quercus"
def is_an_oak(name):
    """ 
    Returns True if the genus is 'Quercus' (case-insensitive).
    Allows minor typos (like one-character mistakes).
    """
    name = name.strip().lower()
    genus = name.split(" ")[0]
    # Find the similarity ratio between input and "quercus"
    similarity = difflib.SequenceMatcher(None, genus, "quercus").ratio()
    return similarity > 0.8  # accept if more than 80% similar

def main(argv):
    """
    process the CSV file and extract oaks.
    """
    f = open('../data/TestOaksData.csv','r')
    g = open('../results/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
    #process each row of .csv
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]):
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]])  
    f.close() # closing files
    g.close()
    return 0


if (__name__ == "__main__"):
    status = main(sys.argv)