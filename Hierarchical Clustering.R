#set seed to make example reproducible
set.seed(123)
data <- data.frame(x=sample(1:10000,7), 
                   y=sample(1:10000,7), 
                   z=sample(1:10000,7))
data
#install.packages("scatterplot3d")

library(scatterplot3d)
s3d <- scatterplot3d(data, color=1:7, pch=19, type="p")
s3d.coords <- s3d$xyz.convert(data)
#label data points(1~7)
text(s3d.coords$x, s3d.coords$y, labels=row.names(data), cex=1, pos=4)

# create own function according to Euclidean distance formula
euclidean_distance <- function(p,q){
  sqrt(sum((p - q)^2))
}

# check points 4 and 6 
euclidean_distance(data[3,],data[5,]) #my own function


par(mfrow=c(1,1))
plot(hclust(dist(data, method="euclidean"), method="single"))
hc<-hclust(dist(data, method="euclidean"), method="single")
#More types below, details not known :(
plot(hclust(dist(data, method="euclidean"), method="complete"))
plot(hclust(dist(data, method="euclidean"), method="average"))
plot(hclust(dist(data, method="euclidean"), method="centroid"))
plot(hclust(dist(data, method="euclidean"), method="ward.D2"))

