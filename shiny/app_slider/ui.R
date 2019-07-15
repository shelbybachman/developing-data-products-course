library(shiny)

# this application takes a value from the user (on a slider) and returns the value plus 10
shinyUI(fluidPage(
  
  # title of application
  titlePanel("HTML Tags"),
  
  # create a sidebar with a main panel and sidebar panel
  sidebarLayout(
    sidebarPanel( # sidebar
      h1("H1 Text"),
      h2("H2 Text"),
      h3("H3 Text"),
      em("Emphasized text"),
      h1("Move the slider!"), # create slider on sidebar panel
      sliderInput("slider2", "Slide Me!", 0, 100, 0) # value on slider is given the name 'slider2'
      # function in server.R is taking slider2 and return it as text1
      # note that we can put the slider and its output anywhere (i.e. in any order)
    ),
    mainPanel( # main panel
       h2("Main Panel Text"),
       code("Some Code!"),
       h3("Slider value plus 10:"),
       textOutput("text1")
    )
  )
))
