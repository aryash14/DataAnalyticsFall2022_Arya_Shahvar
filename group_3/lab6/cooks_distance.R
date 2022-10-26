# Cooks distance example using mcars
mtcars
dim(mtcars)
head(mtcars)
str(mtcars)
model1 <- lm(mpg~cyl + wt, data = mtcars)
model1

help("cooks.distance")
plot(model1, pch = 18, col= 'red', which = c(4))
cooks.distance(model1)
CooksDistance <- cooks.distance(model1)
#round values to 5 decimal points to make interpretation easier
round(CooksDistance, 5)

# sort in ascending order
sort(round(CooksDistance, 5))