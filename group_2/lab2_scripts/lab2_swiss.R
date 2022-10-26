data(swiss)
View(swiss)
str(swiss)
sclass <- kmeans(swiss[2:7, -2], 3) 
table(sclass$cluster, swiss[2:7,2])    
# 
library(e1071)
m <- naiveBayes(swiss[2:7, -2], swiss[2:7,2])    
m
pred <- predict(m, swiss[2:7,-2])
table(levels(pred), swiss[2:7,2])
