#load the data
data <- read.csv("concrete.csv",stringsAsFactors = FALSE)
library(psych)
library(tidyverse)
library(dplyr)
library(ggplot2)

#check the summary statistics
summary(data)

boxplot(data)