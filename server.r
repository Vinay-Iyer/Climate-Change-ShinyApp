rm(list=ls())
<<<<<<< HEAD
setwd('/Git Projects/Climate-Change-ShinyApp')
=======
>>>>>>> 3a4bfee812f4028a82e549ba30a41b1e57211a4f

# Import libraries 
library(shiny)
library(plotly)
library(ggplot2)
library(ggthemes) # themes to assist ggplot
library(data.table) # for fast reading and data manipulation
<<<<<<< HEAD
library(tidyr)
=======
library('tidyr')
>>>>>>> 3a4bfee812f4028a82e549ba30a41b1e57211a4f


data <- read.csv('Data/GlobalLandTemperaturesByState.csv', TRUE,",")
head(data)

row.has.na <- apply(data, 1, function(x){any(is.na(x))})
sum(row.has.na)
data <- data[!row.has.na,]
data <- separate(data,col = dt, into = c("Year", "Month", "Day"), convert = TRUE)
<<<<<<< HEAD
data<- filter(data,Year>1930)
=======

>>>>>>> 3a4bfee812f4028a82e549ba30a41b1e57211a4f

# =============================================================================== 

shinyServer(
  function(input,output) {
    
    # testing a simple plot 
    output$myplot <- renderPlot( {
<<<<<<< HEAD
      
      data_new <- filter(data,Country==input$plot_ctry)
      #data_new <- group_by(Year)
      #data_new <- summarise(data_new,Temp = mean(AverageTemperature))
      
      data_new %>% 
        group_by(Year) %>% 
        summarise(Temp = mean(AverageTemperature)) -> data_new1
      
=======
    
    data_new <- filter(data,Country==input$plot_ctry)
    #data_new <- filter(data_new,Year>1900)
    #data_new <- group_by(Year)
    #data_new <- summarise(data_new,Temp = mean(AverageTemperature))
    
    data_new %>% 
      filter(Year>1930) %>%
      group_by(Year) %>% 
      summarise(Temp = mean(AverageTemperature)) ->data_new1
    
>>>>>>> 3a4bfee812f4028a82e549ba30a41b1e57211a4f
      qplot(Year,Temp, data=data_new1, main="Average Temperature 1930-2013",
            geom=c("line","jitter","smooth"))+ aes(colour = Temp) + 
        scale_color_gradient(low="yellow", high="red")
      
      
    })
    
  }
)

# ===============================================================================

<<<<<<< HEAD
=======


>>>>>>> 3a4bfee812f4028a82e549ba30a41b1e57211a4f
