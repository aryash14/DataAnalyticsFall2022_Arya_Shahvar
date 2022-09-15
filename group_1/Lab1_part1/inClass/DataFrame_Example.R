#creating a dataframe

days <- c("Mon","Tue","Web","Thur","Fri", "SAT", "SUN") #days
temp <- c(28, 30.5, 32, 31.2, 29.3, 27.9, 26.4)
snowed <- c('T', 'T', 'F', 'F', 'T', 'T', 'F')
snowed
help("data.frame")
emptyDataFrame <- data.frame()
emptyDataFrame

RPI_Weather_Week <- data.frame(days, temp, snowed)
RPI_Weather_Week

str(RPI_Weather_Week)
summary(RPI_Weather_Week)
summary(RPI_Weather_Week$temp)

#showing the first row and all the columns
RPI_Weather_Week[1,]
#showing the first col and all the rows
RPI_Weather_Week[,1]

#show snowed col
RPI_Weather_Week[,'snowed']

#show days col
RPI_Weather_Week[,'days']

#show temp col
RPI_Weather_Week[,'temp']

RPI_Weather_Week[1:5, c('days', 'temp')]
subset(RPI_Weather_Week, subset = snowed == TRUE)

sorted.snowed <- order(RPI_Weather_Week[, 'snowed'])
sorted.snowed
RPI_Weather_Week[sorted.snowed, ]