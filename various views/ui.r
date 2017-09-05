library(shiny)
library(plotly)

shinyUI(fluidPage(  
  
  # title
  titlePanel("Climate Change"),

  sidebarPanel(
    h3("Select country"), 
    
    radioButtons("plot_select", "Select country",
                 c("India", "United States", "Canada")),
    
    # Plot
    plotOutput("ctryplot", height = 200), 
    helpText("Data: Extract of Avg tmprs data across the globe")
    
    
  ),
  
  mainPanel(
    plotlyOutput("ctryplot")
  )
  
  
  ))