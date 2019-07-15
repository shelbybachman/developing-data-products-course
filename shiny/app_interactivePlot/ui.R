library(shiny)

# this application visualizes many models and creates an interactive plot
shinyUI(fluidPage(
  titlePanel("Visualize Many Models"),
  # sidebar will display plot parameters
  sidebarLayout(
    sidebarPanel(
      h3("Slope"),
      textOutput("slopeOut"),
      h3("Intercept"),
      textOutput("intOut")
    ),
    # main panel will show a plot
    mainPanel(
       plotOutput("plot1", brush = brushOpts(
         id = "brush1"
       ))
    )
  )
))
