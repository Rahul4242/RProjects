## instal packages not in R

R packages: Several R (data set) packages (containing e.g., tm corpora, openNLP models,
 MIPLIB 2010 instances, etc.) can be downloaded from a CRAN-style repository 
by calling 
install.packages("foo", repos = "http://datacube.wu.ac.at/", type = "source") 
on the R command line, where "foo" represents the package name.

## finding packege for a function

library(sos)
findFn("htmlToText")

### My first animation

f<-function (i){
  for(i in 1:100)
  {
    
    pie(rep(1,i), col =rainbow(i), radius = i)
    #hist(i,col = rainbow(i))
    Sys.sleep(.05)
  }
  
}

###################3

f1<-function (i){
  for(i in 1:100)
  {
    
    
    pie(c(1), col =i)
    Sys.sleep(.03)
  }
  
}

##################


#getting multiple graphs 
par(mfrow=c(1,2)) 

1#For spliting data into Test and Train
install.packages("caTools")
library(caTools)
data<- read.csv("lm.csv")

split<- sample.split(data,SplitRatio=0.8)
train<-subset(data,split=="TRUE")
test<-subset(data,split=="FALSE")

col = ifelse(sort(rr) < .4,'red','green') #conditional coloring
round(123.456,digits=2)

------------------------------------
#ROC
install.packages("ROCR")
library(ROCR)

ROCPred <- prediction(res,training$type)
ROCPerf<- performance(ROCPred,"tpr","fpr")

plot(ROCPerf,colorize=TRUE,print.cutoff.at=seq(0.1,by=0.1))

plot(fit, which=4, cook.levels=cutoff)

-------------------------------------
  td<- sample(mtcars$mpg,size = 5,replace=FALSE) #sample from a data
-----------------------------------------------
Ma<-readline(prompt"asa")
if (a==aa){print("ddd")}

M = matrix( c('a','a','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)

x <- 1               ; c(class(x), mode(x), storage.mode(x), typeof(x))
x <- letters         ; c(class(x), mode(x), storage.mode(x), typeof(x))
x <- TRUE            ; c(class(x), mode(x), storage.mode(x), typeof(x))
x <- cars            ; c(class(x), mode(x), storage.mode(x), typeof(x))
x <- cars[1]         ; c(class(x), mode(x), storage.mode(x), typeof(x))
x <- cars[[1]]       ; c(class(x), mode(x), storage.mode(x), typeof(x))
x <- matrix(cars)    ; c(class(x), mode(x), storage.mode(x), typeof(x))
x <- new.env()       ; c(class(x), mode(x), storage.mode(x), typeof(x))
x <- expression(1+1) ; c(class(x), mode(x), storage.mode(x), typeof(x))
x <- quote(y<-1+1)   ; c(class(x), mode(x), storage.mode(x), typeof(x))
x <- ls              ; c(class(x), mode(x), storage.mode(x), typeof(x))
fun1<- function(a){print (a)}

# Create data for the graph.
v <-  c(9,13,21,8,36,22,12,41,31,33,19)

# Give the chart file a name.
png(file = "histogram.png")

# Create the histogram.
hist(v,xlab = "Weight",col = "yellow",border = "blue")

# Save the file.
dev.off()

open3d()
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1))