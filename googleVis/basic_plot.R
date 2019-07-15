# load googleVis package
suppressPackageStartupMessages(library(googleVis))

# the fruits dataframe will be plotted
# the gvisMotionChart command creates a motion chart in M
# see slides for full range of possible graphics/package documentation
M <- gvisMotionChart(Fruits, "Fruit", "Year",
                     options=list(width=600, height=400))

# when you then enter plot(M) in the command window,
# the plot will open in the browser
# and we see the different variables over time
# (you can then grab the html directly)
plot(M)

# when you enter print(M), you get the html/javascript
# for the chart
print(M,"chart")

# you can also use the "file" option to print to save the html code
# but usually you will use the print() function and embed the plot
# in an R markdown document
# can be used both with knitr and slidify
# ***results = "asis" in chunk options***

# finding parameters to set under options:
# see link to options at link in slides