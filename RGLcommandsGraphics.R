data <- read.xlsx("input.xlsx", sheetIndex = 1)
print(data)
library(rgl)
X=mtcars$vs
Y=mtcars$wt
Z=mtcars$disp
rgl.open() # Open a new RGL device
arrow3d()
rgl.points(X, Y, Z, color ="lightgray") # Scatter plot
rgl.close()
plot3d(X,Y,Z)
install.packages("package's name", repos=c("http://rstudio.org/_packages", "http://cran.rstudio.com"))
arrow3d(p0 = c(1, 1, 1), p1 = c(0, 0, 0),barblen, s = 1/3, theta = pi/12,type = c("extrusion", "lines", "flat", "rotation"),n = 3, width = 1/3, thickness = 0.618 * width,spriteOrigin = NULL,plot = TRUE, ...)

#This solved the issue:
  
remove.packages(c("ggplot2", "data.table"))
install.packages('Rcpp', dependencies = TRUE)
install.packages('ggplot2', dependencies = TRUE)
install.packages('data.table', dependencies = TRUE)