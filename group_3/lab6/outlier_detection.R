# outlier detection using cooks distance
# multivariate regressions using cook's distance
# Cook's distance is an estimate of ther infulence of a data point
# Cook's distance is a summary of how much a regressoipn model changes whe its observation is removed from the data
library(ISLR)
head(Hitters)
dim(Hitters)
is.na(Hitters)

# removing NAs
HittersData <- na.omit(Hitters)
dim(HittersData)

library(dplyr)
glimpse(HittersData)
head(HittersData)

#multivariate regression model to predict salary of baseball players

SalaryPredictModel <- lm(Salary~., data = HittersData)
summary(SalaryPredictModel)
# Multiple R-squared: 0.5461, Adjusted R-squared = 0.5106

# Cook's distance: 
cooksD <- cooks.distance(SalaryPredictModel)
influential <- cooksD[(cooksD > (3 * mean(cooksD, na.rm = TRUE)))]
influential

# 18 players have a cook's distance of 3 times greater than the mean
names_of_influential <- names(influential)
names_of_influential

outliers <- HittersData[names_of_influential, ]
Hitters_Without_Outliers <- HittersData %>% anti_join(outliers)

# model 2: without the outliers
SalaryPredictModel2 <- lm(Salary~., data = Hitters_Without_Outliers)
summary(SalaryPredictModel2)
# Adjusted R-squared is improved from 0.5106 to 0.6445
