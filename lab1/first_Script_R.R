# installing a package
install.packages("MASS")
#load a library
library("MASS")
# attach to memory
attach(Boston)
#data description
?Boston
# show the first 6 rows
head(Boston)
#get the dimension of the dataset
dim(Boston)
# number of rows
nrow(Boston)
# number of cols
ncol(Boston)
# column names
names(Boston)
#showing the structure of the dataset
str(Boston)
#summary() function shows the summary statistics
summary(Boston)
#choose a specific column
Boston$crim
# summary of a specific column
summary(Boston$tax)
