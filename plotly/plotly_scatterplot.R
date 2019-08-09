# this script creates basic interactive scatterplots using plotly

library(plotly)

# basic scatterplot: mpg vs. wt
data(mtcars)
plot_ly(data = mtcars, x = ~wt, y = ~mpg, mode = "markers")

# Export --> save as webpage --> creates a file .html with the interactive plot

# factor color
plot_ly(data = mtcars, x = ~wt, y = ~mpg, mode = "markers", color = ~as.factor(cyl))

# continuous color
plot_ly(data = mtcars, x = ~wt, y = ~mpg, mode = "markers", color = ~disp)

# scatterplot sizing
plot_ly(data = mtcars, x = ~wt, y = ~mpg, mode = "markers",
        color = ~as.factor(cyl), size = ~hp)

# 3D scatterplot, uses webGL 
set.seed(2016-07-21)
temp <- rnorm(100, mean = 30, sd = 5)
pressure <- rnorm(100)
dtime <- 1:100
plot_ly(x = ~temp, y = ~pressure, z = ~dtime, 
        type = "scatter3d", mode = "markers", color = ~temp)
