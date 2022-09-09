if(!require("ISLR")) {
  install.packages("ISLR")
  library(ISLR)
}
data("Auto")
head(Auto)
summary(Auto$mpg)
#same as sumary without the header
fivenum(Auto$mpg)
# histogram
hist(Auto$mpg)
#mean of the dataset
mean(Auto$weight)
median(Auto$horsepower)

help("read.csv")
data1 <- read.csv(file.choose(), header = TRUE)
head(data1)
#opens the csv itself
View(data1)
dim(data1)
