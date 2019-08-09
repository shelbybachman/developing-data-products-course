# this script creates a heatmap in plotly
library(plotly)

# create heatmap
terrain1 <- matrix(rnorm(100*100), nrow = 100, ncol = 100)
plot_ly(z = ~terrain1, type = "heatmap")

# 3D surface
# if you want to do this, you will need to understand what the smoothing is doing
terrain2 <- matrix(sort(rnorm(100*100)), nrow = 100, ncol = 100)
plot_ly(z = ~terrain2, type = "surface")
