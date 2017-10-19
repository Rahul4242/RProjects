#install.packages("randomForest")
library(MASS)
library(randomForest)

set.seed(113)

DRF<-birthwt
help("birthwt")
summary(DRF)
names(DRF)
View(DRF)

data.frame(DRF)
summary(DRF)

#get number of unique values in DRF
apply(DRF,2,function(x) length(unique(x)))

hist(DRF$age)

############## Change cateorical data to factor else they will be considered as numerical data and treated diffrently in random forest
cols<-c("low","race","smoke","ptl","ht","ui","ftv")
#cols<-c("race","smoke","ptl","ht","ui","ftv")
for (i in cols){DRF[,i]=as.factor(DRF[,i])}
str(DRF)
#as.factor()

## ########create test and train data######
#install.packages("caTools")
library(caTools)
ind<-sample.split(Y=DRF$low,SplitRatio=0.7)
DRF_Train<-DRF[ind,]
DRF_Test<-DRF[!ind,]

###Random Forest parameters
#mtry -- number of variable selected at each split
#default for regression= (number of variable/3), 9/3 in this case
#dafault for classification=(square root of number of varaibles)
#low mtry means low corelation between trees which is good
#ntrees is number of trees to grow
#nodesize is min size of terminal nodes, larger the number -lesser the trees

############now the formula

randomFDRF<-randomForest(low~.,DRF_Train,mtry=6,ntree=6)

rf<-randomForest(low~.,DRF_Train,mtry=6,ntree=6)

randomFDRF<-randomForest(low~.,DRF_Train)

attributes(randomFDRF)
summary(randomFDRF)
plot(randomFDRF)
imp<-importance(randomFDRF)
plot(imp,xlab = attributes(imp))
varImpPlot(randomFDRF)  #higher the   MeanDecreaseGini the more important the variable is]

###Prediction for test 'data
install.packages("caret")
library(caret)
PredDRF<- predict(randomFDRF,DRF_Test,type="class")
tabDRF<-table(prd=PredDRF,actual=DRF_Test$low)
sum(diag(tabDRF))/sum(tabDRF)


##########ROC and AUC
#install.packages("pROC")
library(pROC)
predProbModel<- predict(randomFDRF,DRF_Test,type='prob')
auc<-auc(DRF_Test$low,predProbModel[,2])
plot(roc(DRF_Test$low,predProbModel[,2]))

##tuning for the best mTRY

best_mtry<- tuneRF(DRF_Train[,-1],DRF_Train$low,ntreeTry = 20,stepFactor=0.5,improve = 0.01 , trace = F,plot = T)

########## Corelation matrix ploy below
DRF1<-data.frame(DRF$low,DRF$age,DRF$lwt,DRF$race,DRF$smoke,DRF$ptl,DRF$ht,DRF$ui,DRF$ftv,DRF$bwt)
DRF3<-data.frame(as.numeric(DRF$low),as.numeric(DRF$age),as.numeric(DRF$lwt),as.numeric(DRF$race),as.numeric(DRF$smoke),as.numeric(DRF$ptl),as.numeric(DRF$ht),as.numeric(DRF$ui),as.numeric(DRF$ftv),as.numeric(DRF$bwt))
corDRF<-cor(DRF3)
install.packages("corrplot")
library(corrplot)
corrplot(corDRF,method ="circle")
##############

###########3 Number of Nodes per tree ####
hist(treesize(rf),col="green",main="42")
