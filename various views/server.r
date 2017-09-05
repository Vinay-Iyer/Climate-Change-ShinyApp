rm(list=ls())
setwd('/Git Projects/Climate-Change-ShinyApp/various views')

# Import libraries 
library(shiny)
library(plotly)
library(ggplot2)
library(ggthemes) # themes to assist ggplot
library(data.table) # for fast reading and data manipulation
library(tidyr)


data <- read.csv('Data/GlobalLandTemperaturesByState.csv', TRUE,",")
head(data)

row.has.na <- apply(data, 1, function(x){any(is.na(x))})
sum(row.has.na)
data <- data[!row.has.na,]
data <- separate(data,col = dt, into = c("Year", "Month", "Day"), convert = TRUE)
data<- filter(data,Year>1930)
# =============================================================================== 

shinyServer(function(input,output, session) {
  output$ctryplot <- renderPlotly({
    data_new <- filter(data,Country==input$plot_select)
    
    data_new %>% 
      group_by(Year) %>% 
      summarise(Temp = mean(AverageTemperature)) -> data_new1
    
    ggplot(data_new1, aes(x = Year, y = Temp, colour='Country')) + geom_line() +
      labs(x = "Year", y = "AverageTemperature", title = "Average Temperatures") +
      scale_colour_hue("clarity", l = 70, c = 150) + ggthemes::theme_few()
    
  })
  
  }
  
  
  
  
)