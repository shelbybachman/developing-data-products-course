# this script creates a clustered map
library(leaflet)

# create dataframe with points
df <- data.frame(lat = runif(500, min = 39.25, max = 39.35),
                 lng = runif(500, min = -76.65, max = -76.55))

# create map with points clustered
df %>% 
  leaflet() %>%
  addTiles() %>%
  addMarkers(clusterOptions = markerClusterOptions())

# instead of adding clusters or standard popups,
# we can add standard circles
df <- data.frame(lat = runif(20, min = 39.25, max = 39.35),
                 lng = runif(20, min = -76.65, max = -76.55))
df %>% 
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers()
