# this script creates a map with a legend
library(leaflet)

# drawing circles
# where the circle size is related to the population
md_cities <- data.frame(name = c("Baltimore", "Frederick", "Rockville", "Gaithersburg", 
                                 "Bowie", "Hagerstown", "Annapolis", "College Park", "Salisbury", "Laurel"),
                        pop = c(619493, 66169, 62334, 61045, 55232,
                                39890, 38880, 30587, 30484, 25346),
                        lat = c(39.2920592, 39.4143921, 39.0840, 39.1434, 39.0068, 39.6418, 38.9784, 38.9897, 38.3607, 39.0993),
                        lng = c(-76.6077852, -77.4204875, -77.1528, -77.2014, -76.7791, -77.7200, -76.4922, -76.9378, -75.5994, -76.8483))
md_cities %>%
  leaflet() %>%
  addTiles() %>%
  addCircles(weight = 1, radius = sqrt(md_cities$pop) * 30)

# add rectangle at specific latitude and longitude
leaflet() %>%
  addTiles() %>%
  addRectangles(lat1 = 37.3858, lng1 = -122.0595, 
                lat2 = 37.3890, lng2 = -122.0625)

# add legend for items with different colors
df <- data.frame(lat = runif(20, min = 39.25, max = 39.35),
                 lng = runif(20, min = -76.65, max = -76.55),
                 col = sample(c("red", "blue", "green"), 20, replace = TRUE),
                 stringsAsFactors = FALSE)
df %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(color = df$col) %>%
  addLegend(labels = LETTERS[1:3], colors = c("blue", "red", "green"))

# add legend
