library(gdata) 
# #faster xls reader but requires perl!
# bronx1<-read.xls(file.choose(),pattern="BOROUGH",stringsAsFactors=FALSE,sheet=1,perl="<SOMEWHERE>/perl/bin/perl.exe") 
# bronx1<-bronx1[which(bronx1$GROSS.SQUARE.FEET!="0" & bronx1$LAND.SQUARE.FEET!="0" & bronx1$SALE.PRICE!="$0"),]

#alternate
library("xlsx")
bronx1<-read.xlsx("./rollingsales_bronx.xls",pattern="BOROUGH",stringsAsFactors=FALSE,sheetIndex=1,startRow=5,header=TRUE)
View(bronx1)
str(bronx1)
#
attach(bronx1) # If you choose to attach, leave out the "data=." in lm regression
help("sub")
SALE.PRICE<-sub("$","",SALE.PRICE) 
SALE.PRICE<-as.numeric(gsub(",","", SALE.PRICE)) 
GROSS.SQUARE.FEET<-as.numeric(gsub(",","", GROSS.SQUARE.FEET)) 
LAND.SQUARE.FEET<-as.numeric(gsub(",","", LAND.SQUARE.FEET)) 
plot(log(GROSS.SQUARE.FEET), log(SALE.PRICE)) 
# SALE.PRICE[is.na(bronx1$SALE.PRICE) | bronx1$SALE.PRICE == "Inf" | bronx1$SALE.PRIVE <= 0 ]
# bronx1$SALE.PRICE <- replace(bronx1$SALE.PRICE, bronx1$SALE.PRICE == 0, 5)
# bronx1$GROSS.SQUARE.FEET <- replace(GROSS.SQUARE.FEET, NaN, 0)
# SALE.PRICE[is.na(log(bronx1$SALE.PRICE)) | is.infinite(log(bronx1$SALE.PRICE)) | log(bronx1$SALE.PRIVE) < 0 ] <- 0
# bronx1$GROSS.SQUARE.FEET[is.na(bronx1$GROSS.SQUARE.FEET) | bronx1$GROSS.SQUARE.FEET == "Inf"] <- NA
# bronx1$SALE.PRICE[is.infinite(log(bronx1$SALE.PRICE))] <- 0
length(SALE.PRICE)
tf <- is.infinite(log(SALE.PRICE)) | is.infinite((log(GROSS.SQUARE.FEET)))
# which(is.infinite((log(SALE.PRICE))))
SALE.PRICE.New <-  SALE.PRICE[!tf] 
length(SALE.PRICE.New)
GROSS.SQUARE.FEET.New <- GROSS.SQUARE.FEET[!tf] 
length(GROSS.SQUARE.FEET.New)
plot(log(GROSS.SQUARE.FEET.New), log(SALE.PRICE.New)) 
m1<-lm(log(SALE.PRICE.New)~log(GROSS.SQUARE.FEET.New))
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))

# Model 2
bronx1New <- bronx1[!tf, ]
tf <- is.infinite(log(bronx1New$LAND.SQUARE.FEET))
bronx1New <- bronx1New[!tf, ]
dim(bronx1New)
m2<-lm(log(bronx1New$SALE.PRICE)~log(bronx1New$GROSS.SQUARE.FEET)+log(bronx1New$LAND.SQUARE.FEET)+factor(bronx1New$NEIGHBORHOOD))
summary(m2)
plot(resid(m2))
# Suppress intercept - using "0+ ..."
m2a<-lm(log(bronx1New$SALE.PRICE)~0+log(bronx1New$GROSS.SQUARE.FEET)+log(bronx1New$LAND.SQUARE.FEET)+factor(bronx1New$NEIGHBORHOOD))
summary(m2a)
plot(resid(m2a))

# Model 3
m3<-lm(log(bronx1New$SALE.PRICE)~0+log(bronx1New$GROSS.SQUARE.FEET)+log(bronx1New$LAND.SQUARE.FEET)+factor(bronx1New$NEIGHBORHOOD)+factor(bronx1New$BUILDING.CLASS.CATEGORY))
summary(m3)
plot(resid(m3))

# Model 4
m4<-lm(log(bronx1New$SALE.PRICE)~0+log(bronx1New$GROSS.SQUARE.FEET)+log(bronx1New$LAND.SQUARE.FEET)+factor(bronx1New$NEIGHBORHOOD)*factor(bronx1New$BUILDING.CLASS.CATEGORY))
summary(m4)
plot(resid(m4))
#
