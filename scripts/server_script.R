setwd('/Git Projects/Climate-Change-ShinyApp')
rm(list=ls())

# Import libraries 
library(shiny)
library(plotly)
library(ggplot2)
library(ggthemes) # themes to assist ggplot
library(data.table) # for fast reading and data manipulation
library(tidyr)
library(dplyr)

# Data preprocessing
# ====================================================================================
data <- read.csv('file:///F:/Git Projects/Climate-Change-ShinyApp/Data/GlobalLandTemperaturesByState.csv', TRUE,",")

head(data)
data <- na.omit(data)
#data_new <- summarise(data_new,Temp = mean(AverageTemperature))
#data_new <- filter(data,Country=="India")
#vars <- c(data_new$Year,data_new$AverageTemperature)

data %>%
  separate(col = dt, into = c("Year", "Month", "Day"), convert = TRUE) ->data
data<-na.omit(data)

data %>% 
  filter(Year>1930) -> data1

# ====================================================================================
data1 %>% 
  group_by(Year) %>%
  filter(Country=='India') %>%
  summarise(Temp = mean(AverageTemperature)) %>%
  cbind(Ctry = 'India')  -> d_ind

# Plot area. 
png(filename="plots/ind.png")
ggplot(d_ind, aes(x=Year, y=Temp)) + geom_path(colour = "grey50") + geom_point(aes(colour=Year))
dev.off()
# ====================================================================================
# Collate all country specific data

data1 %>% 
  group_by(Year) %>%
  filter(Country=='Brazil') %>%
  summarise(Temp = mean(AverageTemperature)) %>%
  cbind(Ctry = 'Brazil') -> d_bra

data1 %>% 
  group_by(Year) %>%
  filter(Country=='Russia') %>%
  summarise(Temp = mean(AverageTemperature)) %>%
  cbind(Ctry = 'Russia')  -> d_rus

data1 %>% 
  group_by(Year) %>%
  filter(Country=='United States') %>%
  summarise(Temp = mean(AverageTemperature)) %>%
  cbind(Ctry = 'US') -> d_us

data1 %>% 
  group_by(Year) %>%
  filter(Country=='Canada') %>%
  summarise(Temp = mean(AverageTemperature)) %>%
  cbind(Ctry = 'Canada')-> d_can

data1 %>% 
  group_by(Year) %>%
  filter(Country=='China') %>%
  summarise(Temp = mean(AverageTemperature))  %>%
  cbind(Ctry = 'China')  ->d_chi

data1 %>% 
  group_by(Year) %>%
  filter(Country=='Australia') %>%
  summarise(Temp = mean(AverageTemperature)) %>%
  cbind(Ctry = 'Australia')-> d_aus

facetdata <- rbind(d_aus,d_bra,d_can,d_chi,d_ind,d_rus,d_us)

# Plot area. 
png(filename="plots/facet.png")
ggplot(facetdata, aes(x=Year, y=Temp))+ geom_path(colour = "grey50") + geom_point(aes(colour=Year)) + facet_wrap(~ Ctry)
dev.off()
# ====================================================================================




