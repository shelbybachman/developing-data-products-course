library(shiny)

# define server logic to display slider value
shinyServer(function(input, output) {
   
  output$text1 = renderText(input$slider2 + 10)
  
})
  
