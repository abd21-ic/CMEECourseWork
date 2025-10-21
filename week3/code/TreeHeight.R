# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"

TreeData <- read.csv("../data/trees.csv")

TreeHeight <- function(species, degrees, distance) {
    species <- species
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    #print(paste("Tree height is:", height))
    result <- data.frame(Species = species, Height.m = height)
    return(result)
}

TreeHts <- TreeHeight(TreeData$Species, TreeData$Distance.m,TreeData$Angle.degrees)

write.csv(TreeHts, "../results/TreeHts.csv")
