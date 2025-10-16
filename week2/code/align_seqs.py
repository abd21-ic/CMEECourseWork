# Two example sequences to match

#seq2 = "ATCGCCGGATTACGGG"
#seq1 = "CAATTCGGAT"

#Single external file input (.csv)
def file_sequence(x):
    with open(x, 'r') as file:
        lines = file.readlines()  # Remove whitespace and spaces
        seq1 = lines[1].split(",")[1].strip()
        seq2 = lines[2].split(",")[1].strip()
    return seq1, seq2

seq1, seq2 = file_sequence("../data/combined_file.csv") #Combined csv file with two fasta sequences

# Assign the longer sequence s1, and the shorter to s2
# l1 is length of the longest, l2 that of the shortest

l1 = len(seq1)
l2 = len(seq2)
if l1 >= l2:
    s1 = seq1
    s2 = seq2
else:
    s1 = seq2
    s2 = seq1
    l1, l2 = l2, l1 # swap the two lengths

# A function that computes a score by returning the number of matches starting
# from arbitrary startpoint (chosen by user)
def calculate_score(s1, s2, l1, l2, startpoint):
    matched = "" # to hold string displaying alignements
    score = 0
    for i in range(l2):
        if (i + startpoint) < l1:
            if s1[i + startpoint] == s2[i]: # if the bases match
                matched = matched + "*"
                score = score + 1
            else:
                matched = matched + "-"

    # some formatted output
    #print("." * startpoint + matched)           
    #print("." * startpoint + s2)
    #print(s1)
    #print(score) 
    #print(" ")

    return score

# Test the function with some example starting points:
# calculate_score(s1, s2, l1, l2, 0)
# calculate_score(s1, s2, l1, l2, 1)
# calculate_score(s1, s2, l1, l2, 5)

# now try to find the best match (highest score) for the two sequences
my_best_align = None
my_best_score = -1

for i in range(l1):
    z = calculate_score(s1, s2, l1, l2, i)
    if z > my_best_score:
        my_best_align = "." * i + s2
        my_best_score = z 
print(my_best_align)
print("Best score:", my_best_score)

#Write to external text file
with open("../results/score.txt", "w") as file:
    file.write("Best alignment: " + my_best_align + "\n")
    file.write("Best score: " + str(my_best_score))
