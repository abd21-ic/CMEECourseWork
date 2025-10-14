import csv
import sys
import doctest

#Define function
def is_an_oak(name):
    return name.lower().startswith('quercus') # typo here with "quercus"

import ipdb; ipdb.set_trace()

def main(argv): 
    f = open('../data/TestOaksData.csv','r')
    g = open('../data/JustOaksData.csv','w')
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]):
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]])  
    f.close() # closing files
    g.close() #
    return 0


if (__name__ == "__main__"):
    status = main(sys.argv)

doctest.testmod()