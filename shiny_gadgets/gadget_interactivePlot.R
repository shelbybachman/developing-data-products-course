# this is the code for a basic shiny gadget
# that creates an interactive plot
# it plots data in the trees package
# and extracts a dataframe from a selected portion

# load required packages
library(shiny)
library(miniUI)

# create a function to run the gadget
pickTrees <- function() {
  ui <- miniPage(
    gadgetTitleBar("Select points by dragging your mouse"),
    miniContentPanel(
      plotOutput("plot", height = "100%", brush = "brush")
    )
  )
  server <- function(input, output, session) {
    output$plot <- renderPlot({
      plot(trees$Girth, trees$Volume, main = "Trees!",
           xlab = "Girth", ylab = "Volume")
    })
    observeEvent(input$done, {
      stopApp(brushedPoints(trees, input$brush,
                            xvar = "Girth", yvar = "Volume"))
    })
  }
  runGadget(ui, server)
}

# to run the gadget: 
# (1) source everything in this script
# (2) enter pickTrees in the command window
# (3) press Done to print the selected data in a dataframe in the command window