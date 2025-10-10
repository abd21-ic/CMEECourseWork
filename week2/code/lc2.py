# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# (1) Use a list comprehension to create a list of month,rainfall tuples where
# the amount of rain was greater than 100 mm.
 
# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !).

###STEP 1###
rainfall_months_over_100 = [(i[0], i[1]) for i in rainfall if i[1] > 100]
print("Months and rainfall values when the amount of rain was greater than 100mm:",rainfall_months_over_100)

###STEP 2###
rainfall_months_under_50 = [(i[0], i[1]) for i in rainfall if i[1] < 50]
print("Months and rainfall values when the amount of rain was less than 50mm:", rainfall_months_under_50)

###STEP 3###
rainfall_months_over_100 = []
for i in rainfall:
     if i[1] > 100:
        rainfall_months_over_100.append((i[0], i[1]))
print("Months and rainfall values when the amount of rain was greater than 100mm:",rainfall_months_over_100)

rainfall_months_under_50 = []
for i in rainfall:
     if i[1] < 50:
        rainfall_months_under_50.append((i[0], i[1]))
print("Months and rainfall values when the amount of rain was less than 50mm:", rainfall_months_under_50)


# A good example output is:
#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
# [('JAN', 111.4), ('FEB', 126.1), ('AUG', 140.2), ('NOV', 128.4), ('DEC', 142.2)]
# ... etc.

