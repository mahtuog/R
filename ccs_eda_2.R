library(tidyverse)
library(ggplot2)
library(dplyr)

data <- read.csv("concrete.csv",stringsAsFactors = FALSE)

summary(data)

data %>% filter(ash == 0) %>% count()

summarise(data,(age))