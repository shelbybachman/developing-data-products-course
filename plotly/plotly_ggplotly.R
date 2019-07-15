# this script shows how to use the command ggplotly(),
# which converts a typical ggplot figure to a plotly figure
rm(list = ls())
library(plotly)
library(ggplot2)

# organize the data
set.seed(100)
d <- diamonds[sample(nrow(diamonds), 1000), ]

# create ggplot object
p <- ggplot(data = d, aes(x = carat, y = price)) +
  geom_point(aes(text = paste('Clarity:', clarity)), size = 4) +
  geom_smooth(aes(colour = cut, fill = cut)) +
  facet_wrap(~cut)

# create ggplotly object
(gg <- ggplotly(p))

# in the viewer pane, you see the plotly object
# in the plot pane, you see the standard ggplot object