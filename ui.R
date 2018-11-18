library(shiny)


shinyUI(fluidPage(
  
  titlePanel(h4("Web App Demo renderplot() - Histogram dan Iris", align="center")),
  
  #Sidebarayout
  sidebarLayout(
    
    
    # Sidebar Panel
    sidebarPanel(
      
      selectInput("var", label = "1. Select Quantitative variable",
                  choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width" = 4),
                  selected = 3),
      br(),
      
      sliderInput("bins", "2. Pilih No Bins Pada Histogram", min = 5, max = 25, value = 15),
      
      br(),
      
      radioButtons("color", label = "3. Pilih Warna Histogram", choices = c("Green", "Red", "Yellow"), selected = "Green")
    ),
    
    # Main Panel
    mainPanel(
      tabsetPanel(type = "tab",
                  tabPanel("Summary", verbatimTextOutput("sum")),
                  tabPanel("Structure", verbatimTextOutput("str")),
                  tabPanel("Data", tableOutput("data")),
                  tabPanel("Plot", verbatimTextOutput("text1"), verbatimTextOutput("text2"), verbatimTextOutput("text3"),
                           plotOutput("myhist"))
        
      )
      
    )
  
)
)
)