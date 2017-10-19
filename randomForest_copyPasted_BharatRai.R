# Read Data
data <- read.csv("C:/Users/rnamjosh/Desktop/Dropbox/DS/R Scripts/dataSet/CTG_RF_BhartendraRai.csv", header = TRUE)
str(data)
data$NSP <- as.factor(data$NSP)
table(data$NSP)
plot(data$NSP,col=3)

# Data Partition
set.seed(123)
ind <- sample(2, nrow(data), replace = TRUE, prob = c(0.7, 0.3))
train <- data[ind==1,]
test <- data[ind==2,]

# Random Forest
library(randomForest)
set.seed(222)
rf <- randomForest(NSP~., data=train,
                   ntree = 40,
                   mtry = 8,
                   importance = TRUE,
                   proximity = TRUE)
print(rf)
attributes(rf)
#Plot the rf with some cosmetics
layout(matrix(c(1,2),nrow=1),
       width=c(4,1)) 
par(mar=c(5,4,4,0)) #No margin on the right side

plot(rf)
par(mar=c(5,0,4,2)) #No margin on the left side
plot(c(0,1),type="n", axes=F, xlab="", ylab="")
legend("top", colnames(rf$err.rate),col=1:4,cex=0.8,fill=1:4)

# Prediction & Confusion Matrix - train data
library(caret)
p1 <- predict(rf, train)
confusionMatrix(p1, train$NSP)




##tuning for the best mTRY
# # Prediction & Confusion Matrix - test data
p2 <- predict(rf, test)
confusionMatrix(p2, test$NSP)

##########ROC and AUC  ----- investigation required in this section
#install.packages("pROC")
library(pROC)

auc<-auc(test,p2)
auc<-auc(train$NSP,p1[,2])
?auc
auc<-auc(DRF_Test$low,predProbModel[,2])
plot(roc(DRF_Test$low,predProbModel[,2]))

# Error rate of Random Forest
plot(rf)

# Tune mtry
t <- tuneRF(train[,-22], train[,22],
       stepFactor = 0.5,
       plot = TRUE,
       ntreeTry = 300,
       trace = TRUE,
       improve = 0.05)

# No. of nodes for the trees
hist(treesize(rf),
     main = "No. of Nodes for the Trees",
     col = "green")

# Variable Importance
varImpPlot(rf,
           sort = T
           n.var = 10,
           main = "Top 10 - Variable Importance")
importance(rf)
varUsed(rf)

# Partial Dependence Plot
partialPlot(rf, train, ASTV, "2")

# Extract Single Tree
getTree(rf, 1, labelVar = TRUE)

# Multi-dimensional Scaling Plot of Proximity Matrix
MDSplot(rf, train$NSP)
