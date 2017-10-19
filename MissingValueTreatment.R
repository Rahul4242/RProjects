#Removing the NA rows completely:
TitTrain2 <- na.omit(TitTrain)
is.na(TitTrain2)
library(Hmisc)
impute(TitTrain$Age, mean)  # replace with mean
impute(TitTrain$Age, median)  # median
impute(TitTrain$Age, 0)  # replace specific number
# or if you want to impute manually and in the simple way
TitTrain$Age[is.na(TitTrain$Age)] <- mean(TitTrain$Age, na.rm = T) 
