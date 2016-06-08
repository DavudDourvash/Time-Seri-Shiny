####libraries####
library(shiny)
library(shinydashboard)
library(quantmod)
library(ggplot2)

####server####
shinyServer(
  function(input, output, session){
    inFile <- reactive({
      if (is.null(input$data)) {
        return(NULL)
      } else {
        input$data
      }
    })
    
    myData <- reactive({
      if (is.null(inFile())) {
        return(NULL)
      } else {
        read.csv(inFile()$datapath)
      }
    })
    
    
    output$plot<-
      renderPlot({
        updateSelectInput(
          session,
          "y_input",
          choices=names(myData()))
        plot(myData[,1])
      })
    
    
    #### EXtre Programs####  
    output$num1<-renderText({input$slider1})
  })