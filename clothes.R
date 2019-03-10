# Read in the data from "clothes.csv" file into a data.frame called "clothes".
# Remove all rows from the data.frame where the variable "Price" is empty,
# i.e., equal to "". 


# Write a function called "num" that takes a character vector of prices as
# input, removes the dollar sign, and returns a numeric vector of prices.

library(tidyverse)

clothes <- read.csv("~/Desktop/STAT223/hw1-starter/files/clothes.csv") %>% 
  filter(Price != "")

num <- function(string) { 
  as.numeric(gsub("[^0-9.]", "", string))
} 

# Using the "num" function you just wrote, convert the variable "Price" in the
# clothes data.frame from a character vector to a numeric vector.

clothes <- clothes %>% mutate(Price = num(Price))

# Determine the standard deviation of the price of clothes for each part of the
# body, as indicated by the variable "Body.Location".

clothes %>% group_by(Body.Location) %>% summarise(sd_price = sd(Price))
