data(iris)

#randomise the order of the data
r<-runif(nrow(iris))
iris2<-iris[order(r),] 
summary(iris[,c(1,2,3,4)])
#Prepare Data and normalise values between 0 and 1

normalize <- function(x){return ((x-min(x))/(max(x)-min(x)))}
iris3<-as.data.frame(lapply(iris[,c(1,2,3,4)],normalize))

############################
iris_train<-iris3[1:129,]
iris_test<-iris3[130:150,]
iris_train_target<-iris[1:129,5]
iris_test_target<-iris[130:150,5]
######KNN
require(class)
#sqrt(150) # to find the value of K
knn1<- knn(train=iris_train,test=iris_test,cl=iris_train_target,k=5)
#knn1<- knn(train=iris_train,test=iris_test,cl=iris_train_target)
tab<-table(iris_test_target,knn1)
print(tab)
print(sum(diag(tab))/21)