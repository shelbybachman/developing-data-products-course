suppressPackageStartupMessages(library(googleVis))

# in this script we will plot profit by country
# using a googleVis map plot
G <- gvisGeoChart(Exports, locationvar="Country",
                  colorvar="Profit", options=list(width=600, height=400))
#print(G,"chart")
plot(G)

# next we will zoom in on a region
G2 <- gvisGeoChart(Exports, locationvar="Country",
                  colorvar="Profit", options=list(width=600, height=400, region="150"))
#print(G,"chart")
plot(G2)
