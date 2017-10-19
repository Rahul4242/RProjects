data(iris)
plot(iris)
library(ggplot2)
qplot(pl,pw,data=iris,color = Species)
install.packages("e1071")
library(e1071)

#create test and train data
sam<-sample(150,100)
col<-c("Petal.Length","Petal.Width","Species")
iris_train<-iris[sam,col]
iris_test<-iris[-sam,col]

###################SVM model

#svm1<-svm(Species~.,iris,kernel="linear",cost=5,scale=FALSE)#kernel is dafault:"linear" which is best for classification
#svm2<-svm(Species~.,iris,kernel="radial",cost=.1,scale=TRUE) 
#svm3<-svm(Species~.,iris,kernel="polynomial")

svm1 <-svm(Species~.,data = iris_train,kernel="linear",cost=0.1,scale=FALSE)
plot(svm1,iris_train[,col])
#Confusion Matrix
pred<-predict(svm1,iris)
tab<- table(PRED=pred,ACTUAL=iris$Species)

#Complicated and unanalysed way to plot is below
#plot(svm1,data=iris,Petal.Width~Petal.Length,slice=list(Sepal.Width = 3,Sepal.Length = 5))

#Misclassification rate:
MR<- (1- sum(diag(tab))/sum(tab))
print(MR)
# Tuning to check the best cost- concept is still not clear
tuned<-tune(svm,Species~.,data=iris_train,kernel="linear",ranges=list(cost=c(0.1,1,10,100)))
#tuned<-tune(svm,Species~.,data=iris_train,kernel="linear",ranges=(cost=c(1,10,100,1000,2200)))
summary(tuned) #check for the best performamce and put it as cost in model

#########Predict the testing data
p<-predict(svm1,iris_test[,col],type="class")
plot(p)
table(p,iris_test[,3])
mean(p==iris_test[,3])
iris_test[,3]
mean(p)

#####################ETC
sw<-iris$Sepal.Width
pw<-iris$Petal.Width
pl<-iris$Petal.Length
sl<-iris$Sepal.Length
############ plot without ggplot2 package
plot(sl,sw,col=iris$Species, data=iris)
plot(pl,pw,col=iris$Species, data=iris)
plot(iris$Species,col=sl, data=iris)