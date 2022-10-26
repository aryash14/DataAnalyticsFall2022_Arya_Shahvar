# Cooks distance example using mcars
mtcars
dim(mtcars)
head(mtcars)
str(mtcars)
model1 <- lm(mpg~cyl + wt, data = mtcars)
model1

help("cooks.distance")
#
cooks.distance(model1)
