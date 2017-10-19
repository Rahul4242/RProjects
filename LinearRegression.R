setwd("C:/Users/rnamjosh/Dropbox/DS/WorkDirectory")
a<-read.csv("lm.csv")
p<-lm(B~A,a)
summary(a)
summary(p)

attributes(a)
plot(a)
plot(p, pch=18,col="blue", which = (6) )# there are 6 plots, put number in which to get the desired one
abline(1,2)
#Ctrl L for clear screen

par(mfrow=c(2,2)) #To see all 4 graph together, analysis required to understand
plot(p)
plot(p,pch=10,col="blue")
cooks.distance(p)


# Linear Regression exercise chessplayer

Tab1 <- read.table(file.choose(),header = T,sep = "\t")
head(Tab1)
names(Tab1)
m<-lm(Tab1$Rank~Tab1$Games,Tab1)
y<-Tab1$Rating
