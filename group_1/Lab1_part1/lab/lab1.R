#reading the csv file
EPI_data <- read.csv("./2010EPI_data.csv")
head(EPI_data)
View(EPI_data)
EPI_data <- EPI_data[1:164, ]  
View(EPI_data)
nrow(EPI_data)
#fixing the column name issue
names(EPI_data) <- as.matrix(EPI_data[1, ])
EPI_data <- EPI_data[-1, ]
EPI_data[] <- lapply(EPI_data, function(x)
  type.convert(as.character(x)))
EPI_data
View(EPI_data)
attach(EPI_data) #sets the default object
fix(EPI_data) #launches a simple data editor
EPI #showing the EPI_data$EPI
tf <- is.na(EPI) # records True values if the value is NA
E <- EPI[!tf] # filters out NA values, new array
E

########
#Exercise 1: Exploring the distribution
summary(EPI)
fivenum(EPI, na.rm = True)
stem(EPI)  # stem and leaf plot
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
help(lines)
lines(density(EPI,na.rm=TRUE,bw=1)) # or try bw=“SJ”
help(rug)
rug(EPI)

#######
#Exercise 1: Fitting a distribution beyond histograms
#Cumulative Density Function
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE) 
#Quantile-Quantile?
par(pty="s") 
qqnorm(EPI); qqline(EPI)
#Simulated data from t-distribution:
x <- seq(30, 95, 1)
#Make a Q-Q plot against the generating distribution by: x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)
#DALY
plot(ecdf(DALY), do.points=FALSE, verticals=TRUE) 
#Quantile-Quantile?
par(pty="s") 
qqnorm(DALY); qqline(DALY)
#WATER_H
plot(ecdf(WATER_H), do.points=FALSE, verticals=TRUE) 
#Quantile-Quantile?
par(pty="s") 
qqnorm(WATER_H); qqline(WATER_H)

#Comparing distributions
boxplot(EPI, DALY)
qqplot(EPI, DALY)

help(distributions)

#######
#Exercise 2: Fitting (populations)
#Landlock
EPILand<-EPI[!Landlock]
Eland <- EPILand[!is.na(EPILand)]
hist(Eland)
hist(Eland, seq(30., 95., 1.0), prob=TRUE)

EPI_South_Asia <- EPI[EPI_regions == "South Asia"]
EPI_South_Asia
filterd <- subset(EPI_data, subset = EPI_regions == "South Asia")
View(filterd)
