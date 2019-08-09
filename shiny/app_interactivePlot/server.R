library(shiny)

# define server logic required to create the desired plot
shinyServer(function(input, output) {
  model <- reactive({
    # creates dataframe with girth and volume
    brushed_data <- brushedPoints(trees, input$brush1, 
                                  xvar = "Girth", yvar = "Volume")
    # if fewer than 2 points, return null
    if(nrow(brushed_data) < 2){
      return(NULL)
    }
    # otherwise, fit and return a linear model
    lm(Volume ~ Girth, data = brushed_data)
  })
  # get slope of fit
  output$slopeOut <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][2]
    }
  })
  # get intercept of fit
  output$intOut <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][1]
    }
  })
  # create plot showing fit
  output$plot1 <- renderPlot({
    plot(trees$Girth, trees$Volume, 
         xlab = "Girth", ylab = "Volume", main = "Tree Measurements",
         cex = 1.5, pch = 16, bty = "n")
    if(!is.null(model())){
      abline(model(), col = "blue", lwd = 2)
    }
  })
  
})
