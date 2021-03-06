#CREATE DATASET: DATA USED
set.seed(1)
no_resp <- 500
resp <- 100
response <- factor(c(rep(0,no_resp),rep(1,resp)))
purchased_previously <- factor(c(sample(0:1,no_resp,prob=c(0.6,0.4),replace=T),
                          sample(0:1,resp,prob=c(0.2,0.8),replace=T)))
opened_previously <- factor(sample(0:1,(no_resp+resp),prob=c(0.8,0.2),replace = T))
sales_12mo <- c(rnorm(n=no_resp,mean = 50, sd = 10),
                rnorm(n=resp,mean = 60, sd = 5))
none_open_buy <- factor(c(sample(0:1, no_resp,prob=c(0.8,0.2),replace=T),
                          rep(1,resp)))
test_var <- sample(LETTERS[1:2],(resp+no_resp),replace=T)
 
naive_data <- data.frame(purchased_previously = purchased_previously,
                         opened_previously = opened_previously,
                         sales_12mo = sales_12mo,
                         none_open_buy = none_open_buy,
                         test_var = test_var,
                         response = response)
 
naive_data <- naive_data[sample(1:nrow(naive_data),nrow(naive_data)),]
 
train <- naive_data[1:(nrow(naive_data)*.7),]
test <- naive_data[(nrow(naive_data)*.7+1):nrow(naive_data),]

#Default Parameters
library(e1071)
#Default Paramters
nb_default <- naiveBayes(response~., data=train[,-4])
default_pred <- predict(nb_default, test, type="class")
table(default_pred, test$response,dnn=c("Prediction","Actual"))

#Laplace Smoothing
nb_laplace1 <- naiveBayes(response~., data=train, laplace=1)
laplace1_pred <- predict(nb_laplace1, test, type="class")
table(laplace1_pred, test$response,dnn=c("Prediction","Actual"))

#Structure of naiveBayes Model Object
nb_default$tables$opened_previously
nb_laplace1$tables$opened_previously
prop.table(table(train$response,train$opened_previously,
              dnn=c("Response","Past Opened")))
summary(train$sales_12mo)
nb_default$tables$sales_12mo
pnorm(x, mean=, sd=)

##################################################################
# Predicting with Naive Bayes Classifier

default_pred <- predict(nb_default, test, type="class")

#Return Matrix of Class Probabilities
default_raw_pred <- predict(nb_default, test, type="raw")


              ###### $$$$ END $$$$ #####

#http://www.learnbymarketing.com/tutorials/naive-bayes-in-r/
