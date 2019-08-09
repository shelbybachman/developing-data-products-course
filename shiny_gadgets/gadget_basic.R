# this is the code for a basic shiny gadget

# load required packages
library(shiny)
library(miniUI)

# create a function to run the gadget
myFirstGadget <- function() {
  ui <- miniPage( # mini UI page layout
    gadgetTitleBar("My First Gadget")
  )
  server <- function(input, output, session) {
    # the DONE button closes the app
    observeEvent(input$done, {
      stopApp()
    })
  }
  runGadget(ui, server)
}

# to run the gadget: 
# (1) source everything in this script
# (2) enter myFirstGadget() in the command window
# (3) press Done to close the gadget