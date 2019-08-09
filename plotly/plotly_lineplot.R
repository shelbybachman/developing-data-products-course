# this script creates basic interactive line graphs in plotly

library(plotly)

# line plot showing change over time
data(airmiles) # timeseries data
plot_ly(x = ~time(airmiles), y = ~airmiles, type = "scatter", mode = "lines")

# multi-line plot showing change over time
library(dplyr)
library(tidyr)
data("EuStockMarkets") # timeseries dataset
# convert to dataframe, showing stock index over time
stocks <- as.data.frame(EuStockMarkets) %>%
  gather(index, price) %>%
  mutate(time = rep(time(EuStockMarkets), 4))
plot_ly(data = stocks, x = ~time, y = ~price, type = "scatter", mode = "lines",
        color = ~index)


