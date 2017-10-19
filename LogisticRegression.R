data("mtcars")
LR1<-glm(vs~wt+disp,data=mtcars,family="binomial")
LR1<-glm(vs~.-dsp,data=mtcars,family="binomial")#to remove one of the variable 

------------------------------------
T<-data.frame(wt=2,disp=23)
#test data #details to take sample in GeneralCommands.R

predict.glm(LR1,T,type = "response") #gives the probability
predict(LR1,T)#gives the value
tt<-predict.glm(LR1,mtcars)
Test<- data.frame(wt<-mtcars$wt,disp<-mtcars$disp)

rr<-predict.glm(LR1,Test,type="response")
plot(rr)
plot(sort(rr),col = ifelse(sort(rr) < .4,'red','green'),pch=6) #conditional coloring
--------------------
#ROCPlotting  

install.packages("ROCR")
library(ROCR)

ROCPred <- prediction(rr,mtcars$vs)
ROCPerf<- performance(ROCPred,"tpr","fpr")

plot(ROCPerf,colorize=TRUE,print.cutoff.at=seq(0.1,by=0.1))

