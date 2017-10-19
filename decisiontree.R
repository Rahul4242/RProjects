install.packages("party")
#Read data file
mydata <- read.csv("C:/Users/rnamjosh/Desktop/Dropbox/DS/R Scripts/dataSet/Cardiotocographic_decisiontree.csv")
mydata$NSPF <- as.factor(mydata$NSP)

#Decision tree with party
library(party)
mytree <- ctree(NSPF~LB+AC+FM, mydata, controls=ctree_control(mincriterion=0.9, minsplit=50))
print(mytree)
  plot(mytree,type="simple")

#Misclassification error
tab<-table(predict(mytree), mydata$NSPF)
print(tab)
1-sum(diag(tab))/sum(tab)
plot(tab,3)

mydata1<-data.frame(mydata$NSPF,mydata$LB,mydata$AC)
sapply(mydata1, is.numeric) #showed that data is not numeric
mydata2 <- mydata1[, sapply(mydata1, is.numeric)]
tree3<-cor(mydata2)
install.packages("corrplot")
library(corrplot)
corrplot(mydata2,method ="circle")
