library(shiny)

# this application plots two sets of random uniformly distributed numbers
# based on user-inputted number of values, range, and parameters
shinyUI(fluidPage(
  
  # title of application
  titlePanel("Plot Random Numbers"),
  
  # create a sidebar with a main panel and sidebar panel
  sidebarLayout(
    sidebarPanel( 
      numericInput("numeric", "How many random numbers should be plotted?",
                   value = 1000, min = 1, max = 1000, step = 1),
      sliderInput("sliderX", "Pick minimum and maximum X values",
                  -100, 100, value = c(-50, 50)),
      sliderInput("sliderY", "Pick minimum and maximum Y values",
                  -100, 100, value = c(-50, 50)),
      checkboxInput("show_xlab", "Show/hide X axis label", value = TRUE),
      checkboxInput("show_ylab", "Show/hide Y axis label", value = TRUE),
      checkboxInput("show_title", "Show/hide Title")
    ),
    mainPanel(
       h3("Graph of random points"),
       plotOutput("plot1")
    )
  )
))
