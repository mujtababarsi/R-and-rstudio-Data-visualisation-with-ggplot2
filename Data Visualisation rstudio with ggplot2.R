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
ggplot(data=iris,aes(x=Sepal.Length,fill=Species)) + 
geom_histogram(binwidth = 0.05) # histogram bindwidth = 0.05

# Data VIsualisation with ggplot2: Setting Facets and Scales
install.packages("ggsci")
library(ggsci)

# Setting Faceting
iris_aes + geom_point() + geom_smooth(se=FALSE) + facet_wrap(~Species) # faceting soecified by species
iris_aes + geom_point() + geom_smooth(se=FALSE) + facet_wrap(~Species, scale='free_y') 

# Setting Scales
iris_aes +geom_point() + geom_smooth(se=FALSE) + facet_wrap(~Species, scale='free_y') + scale_x_continuous(limits = c(1,10)) # sepal length vs petal length with limit option x-axis 
iris_aes + geom_point() + geom_smooth(se=FALSE) + facet_wrap(~Species, scale='free_y') + scale_x_reverse() # reverse the x-axis

# Scales for colours, sizes and shapes
iris_aes + geom_point() + geom_smooth(se=FALSE) + facet_wrap(~Species, scale='free_y') + scale_shape_manual(values =c(3,16,17)) + scale_size_manual(values =c(2,3,4)) + scale_colour_manual(values =c('#669999', '#a3c2c2', '#b30059')) # setting colors, size and shape
iris_aes + geom_point() + geom_smooth(se=FALSE) + facet_wrap(~Species, scale='free_y') + scale_color_brewer(palette ="RdYlBu") # scale using RColorBrewer
new_iris <- iris_aes + geom_point(aes(color = Species)) + 
  geom_smooth(aes(color = Species, fill = Species), method = "lm") + 
  facet_wrap(~Species, scale='free_y') 
new_iris + scale_shape_manual(values = c(3,16,17)) + scale_size_manual(values = c(2,3,4)) + scale_color_viridis(discrete = TRUE, option = "D") + scale_fill_viridis(discrete = TRUE) # Scale using palette from viridis package

# The particular case of missing values

df_test <- data.frame(x = 1:10, y = 1:10, 
                      z = c(1, 2, 3, NA, 5, 6, 7, NA, 8, NA))
plot1 <- ggplot(df_test, aes(x, y)) + 
  geom_tile(aes(fill = z), size = 10)
plot1 # plotting with missing values
plot1 + scale_fill_gradient(na.value = NA) # give no color to NA values

# Setting Themes, Coordinates and Labels

# Setting Themes
new_iris + scale_color_tron() + scale_fill_tron() + theme_minimal() # use minimal theme function
new_iris + scale_color_tron() + scale_fill_tron() + 
  theme_minimal() + theme(legend.position = "bottom", 
                          panel.background = element_rect(fill = "#e0ebeb"), 
                          legend.key = element_rect(fill = "#669999")) # customize background and legends
new_iris + scale_color_tron() + scale_fill_tron() + 
  theme(legend.position=c(1,0), legend.justification = c(1,0)) # customize legends position and justification

# Setting coordinates
new_iris2 <- ggplot(data = iris) + geom_point(aes(x = Petal.Length, y = Petal.Width, color = Species)) + facet_wrap(~Species) + scale_color_tron() + scale_fill_tron()
new_iris2 + coord_fixed(ratio = 2) # fix ratio from x to y axis
new_iris2 + coord_trans(x = "log2", y = "log2") # logarithmic transformation
