library(shiny)

# this app predicts car horsepower from miles per gallon
# based on a user-inputted MPG value

shinyUI(fluidPage(
  titlePanel("Predict Horsepower from MPG"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderMPG", "What is the MPG of the car?", 10, 35, value = 20), # slider - select MPG
      checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE), # checkbox - want to show model 1?
      checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE), # checkbox - want to show model 2?
      submitButton("Create plot & predictions") # press this button when ready to plot/predict
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Horsepower from Model 1:"),
      textOutput("pred1"),
      h3("Predicted Horsepower from Model 2:"),
      textOutput("pred2")
    )
  )
))