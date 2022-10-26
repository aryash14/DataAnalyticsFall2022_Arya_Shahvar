# install.packages("naivebayes")
require(mlbench)
# library(naivebayes)
library(e1071)
data(HouseVotes84)
View(HouseVotes84)
model <- naiveBayes(Class ~ ., data = HouseVotes84)
predict(model, HouseVotes84[1:10,-1])
predict(model, HouseVotes84[1:10,-1], type = "raw")

pred <- predict(model, HouseVotes84[,-1])
table(pred, HouseVotes84$Class)

## Example of using a contingency table:
data(Titanic)
View(Titanic)
m <- naiveBayes(Survived ~ ., data = Titanic)
m
pred <- predict(m, as.data.frame(Titanic)[,1:3])
pred
table(pred, as.data.frame(Titanic)[,4])
## Example with metric predictors:
data(iris)
str(iris)
m <- naiveBayes(Species ~ ., data = iris)
## alternatively:
m <- naiveBayes(iris[,-5], iris[,5])
m
table(predict(m, iris[,-5]), iris[,5])

