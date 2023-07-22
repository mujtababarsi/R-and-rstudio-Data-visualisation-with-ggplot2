# load packages
library(ggplot2)
library(RColorBrewer)
library(viridis)
library(dplyr)
#load data 
data("iris")
# working with specific data chosen from iris data set
iris_length = select(iris, Sepal.Length, Petal.Length)
head(iris_length)
# setting Aesthetics and Geometries
iris_aes= ggplot(data = iris,aes(x = Sepal.Length, y = Petal.Length, color = Species))
iris_aes + geom_point()  # display with geom_point()
iris_aes + geom_point() + geom_smooth()  # trend line and area
iris_aes + geom_point() + geom_smooth(se=FALSE)
ggplot(data = iris, aes(x = Sepal.Length, y = Petal.Length, 
                        color = Sepal.Length, size = Sepal.Length)) + geom_point()
qplot(Sepal.Length, Petal.Length, data = iris, color = 
        factor(Species)) + 
  geom_point() + 
  geom_smooth(se=FALSE) # use qplot()
ggplot(data = iris, aes(x = Sepal.Length, y = Petal.Length, 
                        color = Species)) + geom_boxplot() # Boxplot with default options
ggplot(data=iris,aes(x=Sepal.Length)) + geom_bar() # bar plot 

ggplot(data=iris,aes(x=Sepal.Length, y = Petal.Length)) + 
  geom_density_2d_filled() # density plot 

ggplot(data=iris, aes(x=Sepal.Length,fill=Species)) + 
  geom_histogram() # histogram plotting colours by species
