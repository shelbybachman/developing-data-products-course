# this is the code for a basic shiny gadget
# that multiplies two numbers together

# load required packages
library(shiny)
library(miniUI)

# create a function to run the gadget
multiplyNumbers <- function(numbers1, numbers2) {
  ui <- miniPage( # mini UI page layout
    gadgetTitleBar("Multiply Two Numbers"),
    miniContentPanel(
      selectInput("num1", "First Number", choices=numbers1),
      selectInput("num2", "Second Number", choices=numbers2)
    )
  )
  server <- function(input, output, session) {
    # the DONE button closes the app
    observeEvent(input$done, {
      num1 <- as.numeric(input$num1)
      num2 <- as.numeric(input$num2)
      stopApp(num1*num2)
    })
  }
  runGadget(ui, server)
}

# to run the gadget: 
# (1) source everything in this script
# (2) enter multiplyNumbers(your_numbers_range, your_numbers_range_2) in the command window
# (3) press Done to print the result to the command window