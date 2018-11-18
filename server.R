library(shiny)
data(iris)

shinyServer(
  function(input, output) {
    
    colm <- reactive({
      as.numeric(input$var)
    })
    
    output$text1 <- renderText({
      paste("Dataset Variable/Coloumn name is", names(iris[colm()]))
    })
    
    output$text2 <- renderText({
      paste("Warna Histogram is", input$color)
    })
    
    output$text3 <- renderText({
      paste("Nomor dari Histogram Bins is", input$bins)
    })
    
    output$sum <- renderPrint({
      summary(iris)
    })
    
    output$str <- renderPrint({
      str(iris)
    })
    
    output$data <- renderTable({
      colm <- as.numeric(input$var)
      iris[colm]
      #head(iris)
    })
    
    output$myhist <- renderPlot(
      {
        #colm <- as.numeric(input$var)
        hist(iris[,colm()], breaks = seq(0, max(iris[,colm()]), l = input$bins+1), col=input$color, xlim = c(0,max(iris[,colm()])), main = "Histogram dari Iris Dataset", xlab = names(iris[colm()]))
      }
    )
  }
)