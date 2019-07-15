library(shiny)

# define app logic to create plot and generate predictions

shinyServer(function(input, output) {
  # mtcars dataset is loaded by default, so no need to load it
  
  # generate new variable for model2 (breakpoint)
  mtcars$mpgsp <- ifelse(mtcars$mpg - 20 > 0, mtcars$mpg - 20, 0)
  
  # fit the two models to form predictions
  model1 <- lm(hp ~ mpg, data = mtcars)
  model2 <- lm(hp ~ mpgsp + mpg, data = mtcars)
  
  # get prediction for model 1
  # do a calculation based on user input (MPG value)
  model1pred <- reactive({
    mpgInput <- input$sliderMPG # assign user input to value
    predict(model1, newdata = data.frame(mpg = mpgInput)) # make prediction of HP
  })
  
  # get a prediction for model 2
  # same thing as model 1, only now we need to add the extra spline term (mpgsp)
  model2pred <- reactive({
    mpgInput <- input$sliderMPG
    predict(model2, newdata = 
              data.frame(mpg = mpgInput,
                         mpgsp = ifelse(mpgInput - 20 > 0, # create spline term
                                        mpgInput - 20, 0)))
  })
  
  # create the outputs (ui is looking for plot1)
  output$plot1 <- renderPlot({
    mpgInput <- input$sliderMPG
    
    plot(mtcars$mpg, mtcars$hp, xlab = "Miles Per Gallon", 
         ylab = "Horsepower", bty = "n", pch = 16,
         xlim = c(10, 35), ylim = c(50, 350))
    if(input$showModel1){ # if user wants to show model 1, add fit for model 1
      abline(model1, col = "red", lwd = 2)
    }
    if(input$showModel2){ # if user wants to show model 2, add fit for model 2
      model2lines <- predict(model2, newdata = data.frame(
        mpg = 10:35, mpgsp = ifelse(10:35 - 20 > 0, 10:35 - 20, 0)
      ))
      lines(10:35, model2lines, col = "blue", lwd = 2)
    }
    
    # create the legend
    legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, 
           col = c("red", "blue"), bty = "n", cex = 1.2)
    
    # we add points at the inputted MPG value and the corresponding predicted values
    points(mpgInput, model1pred(), col = "red", pch = 16, cex = 2)
    points(mpgInput, model2pred(), col = "blue", pch = 16, cex = 2)
  })
  
  # store the predicted HP for this MPG based on model 1
  output$pred1 <- renderText({
    model1pred()
  })
  
  # store the predicted HP for this MPG based on model 2
  output$pred2 <- renderText({
    model2pred()
  })
})