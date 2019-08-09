suppressPackageStartupMessages(library(googleVis))

# in this script we create multiple plots together
# notice that the dimensions have been adjusted

# create map plot
G <- gvisGeoChart(Exports, locationvar="Country",
                  colorvar="Profit", options=list(width=200, height=100))

# create a googleVis table
T1 <- gvisTable(Exports, options=list(width=200, height=270))

# create a googleVis motion chart
M <- gvisMotionChart(Fruits, "Fruit", "Year",
                     options=list(width=400, height=370))

# merge the map and table
GT <- gvisMerge(G, T1, horizontal=FALSE)

# merge the map/table and the motion chart
GTM <- gvisMerge(GT, M, horizontal=TRUE, tableOptions = "bgcolor=\"#CCCCCC\" cellspacing=10")

# display the plots
plot(GTM)
