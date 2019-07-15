# this script creates a map with hover text

rm(list = ls())
library(plotly)

# create data frame
state_pop <- data.frame(State = state.abb, Pop = as.vector(state.x77[,1]))

# create hover text - state abbreviation + line break + population
state_pop$hover <- with(state_pop, paste(State, '<br>', "Population:", Pop))

# make state borders red
borders <- list(color = toRGB("red"))

# Set up some mapping options
map_options <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = TRUE,
  lakecolor = toRGB('white')
)

# create a map plot showing population by state with hover text
plot_ly(z = ~state_pop$Pop, text = ~state_pop$hover, locations = ~state_pop$State, 
        type = 'choropleth', locationmode = 'USA-states', 
        color = state_pop$Pop, colors = 'Blues', marker = list(line = borders)) %>%
  layout(title = 'US Population in 1975', geo = map_options)


