library(dplyr)
library(tidyr)
library(ggplot2)

data <- read.csv('Data/GlobalLandTemperaturesByState.csv', TRUE,",")
head(data)

row.has.na <- apply(data, 1, function(x){any(is.na(x))})
sum(row.has.na)
data <- data[!row.has.na,]
data <- separate(data,col = dt, into = c("Year", "Month", "Day"), convert = TRUE)


df <- data.frame(
  x = runif(100),
  y = runif(100),
  z1 = rnorm(100),
  z2 = abs(rnorm(100))
)

# Plots
ggplot(df, aes(x, y)) + geom_point(aes(colour = z2)) 
ggplot(df, aes(x, y)) + geom_point(aes(colour = z1))+ scale_colour_gradient2()
ggplot(df, aes(x, y)) +   geom_point(aes(colour = z1)) +  scale_colour_gradientn(colours = terrain.colors(10))
ggplot(faithfuld, aes(waiting, eruptions)) +  geom_raster(aes(fill = density)) +  scale_fill_gradientn(colours = terrain.colors(10))
ggplot(df, aes(x, y)) + geom_point(aes(colour = z2)) + scale_colour_gradient(low = "white", high = "black")
