setwd("C:/Users/rnamjosh/Desktop/Dropbox/DS/WorkDirectory")
cars<-read.csv("LR_car_sales.csv")

cars2<-na.omit(cars) #omit null values

fit1<-lm(price~sales+width+length,cars2)
fit2<-lm(price~sales,cars2)

anova(fit1, fit2)

cars2cars2#Anova
fit <- aov(price ~ ., data=cars)

View(cars)

plot(fit3, pch=18,col="blue", which = (5) )
plot(cars)

# getting corelation matrix
corCars<-cor(cars)

## visualisation of the corelation
cars3<-data.frame(cars2$sales,cars2$type,cars2$horsepow)
cor3<-cor(cars3)
install.packages("corrplot")
library(corrplot)
corrplot(cor3,method ="circle")

############################
pairs.panel(cars3)
library(ROCR)
library(gplots)
