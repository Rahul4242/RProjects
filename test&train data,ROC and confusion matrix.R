## ########create test and train data######
#install.packages("caTools")
library(caTools)
ind<-sample.split(Y=DRF$low,SplitRatio=0.7)
DRF_Train<-DRF[ind,]
DRF_Test<-DRF[!ind,]
############Test and Train - other way simple way
setwd("C:/Users/rnamjosh/Desktop/Dropbox/DS/WorkDirectory")
cars<-read.csv("LR_car_sales.csv")
dt = sort(sample(nrow(cars), nrow(cars)*.7))
train<-cars[dt,]
test<-cars[-dt,]
#################splitting data into 3

idx <- sample(seq(1, 3), size = nrow(iris), replace = TRUE, prob = c(.8, .2, .2))
train <- iris[idx == 1,]
test <- iris[idx == 2,]
cal <- iris[idx == 3,]

###############################33
set.seed(123)y


ind <- sample(2, nrow(data), replace = TRUE, prob = c(0.7, 0.3))
train <- data[ind==1,]
test <- data[ind==2,]

############################