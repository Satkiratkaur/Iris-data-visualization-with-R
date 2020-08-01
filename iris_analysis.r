library(ggplot2) # Data visualization
library(readr) # CSV file I/O, e.g. the read_csv function
library(gridExtra)
library(grid)
library(plyr)
library(tidyverse)
# Load the dataset
iris <- read_csv("irisdataset.csv")


# First let's get a random sampling of the data
iris[sample(nrow(iris),10),]

# Density & Frequency analysis with the Histogram,

# Sepal length 
HisSl <- ggplot(data=iris, aes(x=sepal_length))+
  geom_histogram(binwidth=0.2, color="black", aes(fill=species)) + 
  xlab("Sepal Length (cm)") +  
  ylab("Frequency") + 
  theme(legend.position="none")+
  ggtitle("Histogram of Sepal Length")+
  geom_vline(data=iris, aes(xintercept = mean(sepal_length)),linetype="dashed",color="grey")
# Sepal width
HistSw <- ggplot(data=iris, aes(x=sepal_width)) +
  geom_histogram(binwidth=0.2, color="black", aes(fill=species)) + 
  xlab("Sepal Width (cm)") +  
  ylab("Frequency") + 
  theme(legend.position="none")+
  ggtitle("Histogram of Sepal Width")+
  geom_vline(data=iris, aes(xintercept = mean(sepal_width)),linetype="dashed",color="grey")


# Petal length
HistPl <- ggplot(data=iris, aes(x=petal_length))+
  geom_histogram(binwidth=0.2, color="black", aes(fill=species)) + 
  xlab("Petal Length (cm)") +  
  ylab("Frequency") + 
  theme(legend.position="none")+
  ggtitle("Histogram of Petal Length")+
  geom_vline(data=iris, aes(xintercept = mean(petal_length)),
             linetype="dashed",color="grey")



# Petal width
HistPw <- ggplot(data=iris, aes(x=petal_width))+
  geom_histogram(binwidth=0.2, color="black", aes(fill=species)) + 
  xlab("Petal Width (cm)") +  
  ylab("Frequency") + 
  theme(legend.position="right" )+
  ggtitle("Histogram of Petal Width")+
  geom_vline(data=iris, aes(xintercept = mean(petal_width)),linetype="dashed",color="grey")


# Plot all visualizations
grid.arrange(HisSl + ggtitle(""),
             HistSw + ggtitle(""),
             HistPl + ggtitle(""),
             HistPw  + ggtitle(""),
             nrow = 2,
             top = textGrob("Iris Frequency Histogram", 
                            gp=gpar(fontsize=15))
)
# Notice the shape of the data, most attributes exhibit a normal distribution. 
# You can see the measurements of very small flowers in the Petal width and length column.


# We can review the density distribution of each attribute broken down by class value. 
# Like the scatterplot matrix, the density plot by class can help see the separation of classes. 
# It can also help to understand the overlap in class values for an attribute.

DhistPl <-    ggplot(iris, aes(x=petal_length, colour=species, fill=species)) +
  geom_density(alpha=.3) +
  geom_vline(aes(xintercept=mean(petal_length),  colour=species),linetype="dashed",color="grey", size=1)+
  xlab("Petal Length (cm)") +  
  ylab("Density")+
  theme(legend.position="none")

DhistPw <- ggplot(iris, aes(x=petal_width, colour=species, fill=species)) +
  geom_density(alpha=.3) +
  geom_vline(aes(xintercept=mean(petal_width),  colour=species),linetype="dashed",color="grey", size=1)+
  xlab("Petal Width (cm)") +  
  ylab("Density")



DhistSw <- ggplot(iris, aes(x=sepal_width, colour=species, fill=species)) +
  geom_density(alpha=.3) +
  geom_vline(aes(xintercept=mean(sepal_width),  colour=species), linetype="dashed",color="grey", size=1)+
  xlab("Sepal Width (cm)") +  
  ylab("Density")+
  theme(legend.position="none")


DhistSl <- ggplot(iris, aes(x=sepal_length, colour=species, fill=species)) +
  geom_density(alpha=.3) +
  geom_vline(aes(xintercept=mean(sepal_length),  colour=species),linetype="dashed", color="grey", size=1)+
  xlab("Sepal Length (cm)") +  
  ylab("Density")+
  theme(legend.position="none")


# Plot all density visualizations
grid.arrange(DhistSl + ggtitle(""),
             DhistSw  + ggtitle(""),
             DhistPl + ggtitle(""),
             DhistPw  + ggtitle(""),
             nrow = 2,
             top = textGrob("Iris Density Plot", 
                            gp=gpar(fontsize=15))
)
# Next with the bloxplot we will identify some outliers. As you can see some classes do not overlap at all (e.g. Petal Length) 
# where as with other attributes there are hard to tease apart (Sepal Width).

ggplot(iris, aes(species, petal_length, fill=species)) + 
  geom_boxplot()+
  scale_y_continuous("Petal Length (cm)", breaks= seq(0,30, by=.5))+
  labs(title = "Iris Petal Length Box Plot", x = "species")

# Let's plot all the variables in a single visualization that will contain all the boxplots


BpSl <- ggplot(iris, aes(species, sepal_length, fill=species)) + 
  geom_boxplot()+
  scale_y_continuous("Sepal Length (cm)", breaks= seq(0,30, by=.5))+
  theme(legend.position="none")



BpSw <-  ggplot(iris, aes(species, sepal_width, fill=species)) + 
  geom_boxplot()+
  scale_y_continuous("Sepal Width (cm)", breaks= seq(0,30, by=.5))+
  theme(legend.position="none")



BpPl <- ggplot(iris, aes(species, petal_length, fill=species)) + 
  geom_boxplot()+
  scale_y_continuous("Petal Length (cm)", breaks= seq(0,30, by=.5))+
  theme(legend.position="none")



BpPw <-  ggplot(iris, aes(species, petal_width, fill=species)) + 
  geom_boxplot()+
  scale_y_continuous("Petal Width (cm)", breaks= seq(0,30, by=.5))+
  labs(title = "Iris Box Plot", x = "Species")



# Plot all visualizations
grid.arrange(BpSl  + ggtitle(""),
             BpSw  + ggtitle(""),
             BpPl + ggtitle(""),
             BpPw + ggtitle(""),
             nrow = 2,
             top = textGrob("Sepal and Petal Box Plot", 
                            gp=gpar(fontsize=15))
)

# You can also visualize the data using the violin plots. They are similar to the Box Plots but they 
# show the number of points at a particular value by the width of the shapes. 
# The can also include the marker for the median and a box for the interquartile range.


VpSl <-  ggplot(iris, aes(species, sepal_length, fill=species)) + 
  geom_violin(aes(color = species), trim = T)+
  scale_y_continuous("Sepal Length", breaks= seq(0,30, by=.5))+
  geom_boxplot(width=0.1)+
  theme(legend.position="none")

VpSw <-  ggplot(iris, aes(species, sepal_width, fill=species)) + 
  geom_violin(aes(color = species), trim = T)+
  scale_y_continuous("Sepal Width", breaks= seq(0,30, by=.5))+
  geom_boxplot(width=0.1)+
  theme(legend.position="none")



VpPl <-  ggplot(iris, aes(species, petal_length, fill=species)) + 
  geom_violin(aes(color = species), trim = T)+
  scale_y_continuous("Petal Length", breaks= seq(0,30, by=.5))+
  geom_boxplot(width=0.1)+
  theme(legend.position="none")




VpPw <-  ggplot(iris, aes(species, petal_width, fill=species)) + 
  geom_violin(aes(color = species), trim = T)+
  scale_y_continuous("Petal Width", breaks= seq(0,30, by=.5))+
  geom_boxplot(width=0.1)+
  labs(title = "Iris Box Plot", x = "species")


# Plot all visualizations
grid.arrange(VpSl  + ggtitle(""),
             VpSw  + ggtitle(""),
             VpPl + ggtitle(""),
             VpPw + ggtitle(""),
             nrow = 2,
             top = textGrob("Sepal and Petal Violin Plot", 
                            gp=gpar(fontsize=15))
)

# Now let's create a scatterplot of petal lengths versus petal widths with the color & shape by species. 
# There is also a regression line with a 95% confidence band.
# Notice the petal length of the setosa is clearly a differenciated cluster so it will be a good predictor for ML.

ggplot(data = iris, aes(x = petal_length, y = petal_width))+
  xlab("Petal Length")+
  ylab("Petal Width") +
  geom_point(aes(color = species,shape=species))+
  geom_smooth(method='lm')+
  ggtitle("Petal Length vs Width")


# Here is a similar plot with more details on the regression line.
library(car)
library(dplyr)
scatterplot(iris$petal_length,iris$petal_width)

# Now check the Sepal Length vs Width. Notice the sepal of the Virginica and Versicolor species is more mixed, this feature might not be a good predictor.
ggplot(data=iris, aes(x = sepal_length, y = sepal_width)) +
  geom_point(aes(color=species, shape=species)) +
  xlab("Sepal Length") + 
  ylab("Sepal Width") +
  ggtitle("Sepal Length vs Width")

# Based on all the plots we have done we can see there is certain correlation. Let's take a look at the pairwise correlation numerical values to 
# ascertain the relationships in more detail.

library(GGally)
ggpairs(data = iris[1:4],
        title = "Iris Correlation Plot",
        upper = list(continuous = wrap("cor", size = 5)), 
        lower = list(continuous = "smooth")
)

# The examination of the plot revelas a strong correlation between the variables Petal Width and the Petal Length (96%) as well as
# The Sepal Length and Petal Length (87%).

# The heatmat is another useful exploratory plot. It is like a two dimentional histogram and it works by using color
# intensity to represent how large the data value is. The brighter the color the larger the value.
# For example the color white represents the largest value while the red represent the smallest one 
# with different colors which represent the different values in betwwen. 

# Let's Ccreate the matrix and transpose it before using it for the heatmap to 
# ensure the columns corresponds to the features and the rows correspond to the observations.

irisMatix <- as.matrix(iris[1:150, 1:4])
irisTransposedMatrix <- t(irisMatix)[,nrow(irisMatix):1]

image(1:4, 1:150, irisTransposedMatrix)