# this script creates several plot types in plotly
library(plotly)

# histogram
plot_ly(x = ~precip, type = "histogram")

# boxplot
plot_ly(data = iris, y = ~Petal.Length, color = ~Species, type = "box")
