library(plotly)
setwd('/Git Projects/Climate-Change-ShinyApp')

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

data_new <- filter(data,Country=="India")










