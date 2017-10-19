library(MASS)
library(neuralnet)
dataset<- Boston
dataset
View(dataset)

plot(dataset)
hist(dataset$crim)

apply(dataset,2,range) #apply(dataset,MARGIN = 2,FUN = range) same meaning

maxValue <- apply(dataset,2,max)
minValue

plot(maxValue, type = "o")
