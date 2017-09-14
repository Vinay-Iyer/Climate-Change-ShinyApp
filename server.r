rm(list=ls())
setwd('/Git Projects/Climate-Change-ShinyApp')

# Import libraries 
library(shiny)
library(plotly)
library(ggplot2)
library(ggthemes) # themes to assist ggplot
library(data.table) # for fast reading and data manipulation
library(tidyr)
library('tidyr')

data <- read.csv('Data/GlobalLandTemperaturesByState.csv', TRUE,",")
head(data)

row.has.na <- apply(data, 1, function(x){any(is.na(x))})
sum(row.has.na)
data <- data[!row.has.na,]
data <- separate(data,col = dt, into = c("Year", "Month", "Day"), convert = TRUE)
data<- filter(data,Year>1930)
# =============================================================================== 

shinyServer(
  function(input,output) {
    
    # testing a simple plot 
    output$myplot <- renderPlot( {

      data_new <- filter(data,Country==input$plot_ctry)
      #data_new <- group_by(Year)
      #data_new <- summarise(data_new,Temp = mean(AverageTemperature))
      
      data_new %>% 
        group_by(Year) %>% 
        summarise(Temp = mean(AverageTemperature)) -> data_new1
      

    data_new <- filter(data,Country==input$plot_ctry)
    #data_new <- filter(data_new,Year>1900)
    #data_new <- group_by(Year)
    #data_new <- summarise(data_new,Temp = mean(AverageTemperature))
    
    data_new %>% 
      filter(Year>1930) %>%
      group_by(Year) %>% 
      summarise(Temp = mean(AverageTemperature)) ->data_new1
    
      qplot(Year,Temp, data=data_new1, main="Average Temperature 1930-2013",
            geom=c("line","jitter","smooth"))+ aes(colour = Temp) + 
        scale_color_gradient(low="yellow", high="red")
      
      
    })
    
  }
)

# ===============================================================================

