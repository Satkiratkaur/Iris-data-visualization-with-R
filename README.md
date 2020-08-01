# Iris-data-visualization-with-R
Context
The Iris flower data set is a multivariate data set introduced by the British statistician and biologist Ronald Fisher in his 1936 paper The use of multiple measurements in taxonomic problems. It is sometimes called Anderson's Iris data set because Edgar Anderson collected the data to quantify the morphologic variation of Iris flowers of three related species. The data set consists of 50 samples from each of three species of Iris (Iris Setosa, Iris virginica, and Iris versicolor). Four features were measured from each sample: the length and the width of the sepals and petals, in centimeters.
This dataset became a typical test case for many statistical classification techniques in machine learning such as support vector machines

Content
The dataset contains a set of 150 records under 5 attributes - petal_length, petal_width, sepal_length, sepal_width and Class(species).

1. Density & Frequency analysis with the Histogram
Notice the shape of the data, most attributes exhibit a normal distribution. You can see the measurements of very small flowers in the Petal width and length column.

https://github.com/Satkiratkaur/Iris-data-visualization-with-R/blob/master/Rplot1.png

2. We can review the density distribution of each attribute broken down by class value. 
Like the scatterplot matrix, the density plot by class can help see the separation of classes. It can also help to understand the overlap in class values for an attribute.

https://github.com/Satkiratkaur/Iris-data-visualization-with-R/blob/master/Rplot2.png

3. Next with the bloxplot we will identify some outliers. As you can see some classes do not overlap at all (e.g. petal_length) where as with other attributes there are hard to tease apart (sepal_width).
I will plot all the variables in a single visualization that will contain all the boxplots

https://github.com/Satkiratkaur/Iris-data-visualization-with-R/blob/master/Rplot3.png

4.  WE can also visualize the data using the violin plots. They are similar to the Box Plots but they show the number of points at a particular value by the width of the shapes. 
They can also include the marker for the median and a box for the interquartile range.

https://github.com/Satkiratkaur/Iris-data-visualization-with-R/blob/master/Rplot4.png

5. Now let's create a scatterplot of petal lengths versus petal widths with the color & shape by species. 

https://github.com/Satkiratkaur/Iris-data-visualization-with-R/blob/master/Rplot5.png

6. There is also a regression line with a 95% confidence band. Notice the petal length of the setosa is clearly a differenciated cluster so it will be a good predictor for ML.

https://github.com/Satkiratkaur/Iris-data-visualization-with-R/blob/master/Rplot6.png

7. Here is a similar scatterplot with more details on the regression line made using 'car' package. 

https://github.com/Satkiratkaur/Iris-data-visualization-with-R/blob/master/Rplot7.png

8. Now we will check the Sepal Length vs Width. Notice the sepal of the Virginica and Versicolor species is more mixed, this feature might not be a good predictor.

https://github.com/Satkiratkaur/Iris-data-visualization-with-R/blob/master/Rplot8.png

9. Based on all the plots we have done we can see there is certain correlation. Let's take a look at the pairwise correlation numerical values to ascertain the relationships in more detail.

https://github.com/Satkiratkaur/Iris-data-visualization-with-R/blob/master/Rplot9.png

The examination of the plot revelas a strong correlation between the variables Petal Width and the Petal Length (96%) as well as the Sepal Length and Petal Length (87%).

10. The heatmat is another useful exploratory plot. It is like a two dimentional histogram and it works by using color intensity to represent how large the data value is. 
The brighter the color the larger the value. For example the color white represents the largest value while the red represent the smallest one with different colors which represent the different values in betwwen. 
Let's create the matrix and transpose it before using it for the heatmap to ensure the columns corresponds to the features and the rows correspond to the observations.

https://github.com/Satkiratkaur/Iris-data-visualization-with-R/blob/master/Rplot10.png
