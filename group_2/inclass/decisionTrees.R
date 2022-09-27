# Decision Trees --
# Classification Tree
# Install the following libararies/packages in RStudio
if(!require("rpart")) {
  install.packages("rpart")
  library(rpart)
}
library(rpart.plot)
# we will be using the iris dataset
iris
dim(iris)
# creating a sample from the iris dataset (shuffles the dataset as well)
s_iris <- sample(150,100)
s_iris
# creat testing and training sets
iris_train <-iris[s_iris,]
iris_test <-iris[-s_iris,] #chooses the remaining 50  rows
dim(iris_test)
dim(iris_train)

# generate the decision tree model
dectionTreeModel <- rpart(Species~., iris_train, method = "class")
# dectionTreeModel <- rpart(Species~Sepal.Length+ Sepal.Width + Pedal.Length + Pedal.Width, iris_train, method = "class")
dectionTreeModel

#plotting the decision tree model using
#rpart.plot() function
rpart.plot(dectionTreeModel)
