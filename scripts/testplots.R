library(plotly)
setwd('/Git Projects/Climate-Change-ShinyApp')
rm(list=ls())
# Import libraries 
library(shiny)
library(plotly)
library(ggplot2)
library(ggthemes) # themes to assist ggplot
library(data.table) # for fast reading and data manipulation
library(tidyr)

# Data preprocessing
# ====================================================================================
data <- read.csv('Data/GlobalLandTemperaturesByState.csv', TRUE,",")

head(data)
data <- na.omit(data)

data <- separate(data,col = dt, into = c("Year", "Month", "Day"), convert = TRUE)
#data_new <- summarise(data_new,Temp = mean(AverageTemperature))
data_new <- filter(data,Country=="India")
vars <- c(data_new$Year,data_new$AverageTemperature)

data_new %>% 
  filter(Year>1900) %>%
  group_by(Year) %>% 
  summarise(Temp = mean(AverageTemperature)) ->data1

# ====================================================================================
# Plot area. 

png(filename="plots/plot1.png")
ggplot(data1, aes(x=Year, y=Temp)) + geom_path(colour = "grey50") + geom_point(aes(colour=Year))
dev.off()


