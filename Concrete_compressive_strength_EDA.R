data = read.csv("concrete.csv",stringsAsFactors = FALSE)
library(psych)
library(dplyr)
library(tidyverse)
library(ggplot2)

pairs.panels(data)

# from the pair plots , most important cols seems to be cement (0.5 Pearson Coeff) & 
# super plastic (0.37 Pearson Coeff)

# draw the scatter plot and regression line using ggplot

ggplot(data,aes(x=cement,y=strength)) + geom_point() + geom_smooth(method="lm",se=FALSE)

#there are few cases where strength is very low compared to the amount of cement used.

#try to check values where strength < 30 and cement > 400 using dplyr
data %>% filter(cement > 400 & strength < 30) #data seems to have been collected during initial days
#when concrete is still strengthening

#checking the composition for high strength concretes
data %>% filter(cement > 400 & strength > 60) %>% arrange(cement) # age is higher

#plot super plastic

ggplot(data,aes(x=superplastic,y=strength)) + geom_point() + geom_smooth(method="lm",se=FALSE)
#many 0s where concrete strenght is high

#plot cement vs strenght based on age
datafil <- data %>% filter(age>28)
ggplot(datafil,aes(x=cement,y=strength)) + geom_point(aes(col=factor(age),size=superplastic)) + geom_smooth(method="lm",se=FALSE)
# concrete reaches max strenght in 28 days , lets see how much the data for age > 28
# there seems to be a lot of points having low strength inspite of having a decent amount 
# of cement > 300 and age, in these cases super plastic is lesser

#use dplyr to filter out those rows
datafil %>% filter(cement>300,age>120,strength<40)
datafil %>% filter(cement>300,age>120,strength<40) %>% summarize(fine_agg_avg=mean(fineagg))
# super plastic is 0 , water is around 190 , coarse agg around 970 
# fineagg 790 on average


# check the values where celemt is high , super plastic is 0 , and strength is high , 
# age is high , what is the difference

datafil %>% filter(cement>300, age>120, strength > 60, superplastic <10)
#course agg is much higher = 1125 , fine_agg is 613


#check out data explorer package
library(DataExplorer)

DataExplorer::plot_histogram(data)

DataExplorer::GenerateReport(data,output_file = "concrete_data_report.html")


DataExplorer::plot_density(data)


plot_str(data)

plot_correlation(data, type = 'continuous','strength')


#use facets to split the data based on fly ash
ggplot(datafil,aes(x=cement,y=strength)) +
  geom_point(aes(col=factor(age),size=superplastic)) +
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap( ~ ash, nrow=3)



#try to divide concretes based on strength after 28 days 

olderThan28Days <- data %>% filter(age > 28) %>% arrange(strength)
levels <- c(-Inf,30,50,Inf)
labels <- c("Low Grade","Medium Grade","High Grade")
olderThan28DayswithGrades <- olderThan28Days %>% mutate(grades = cut(strength,levels,labels = labels))

ggplot(olderThan28DayswithGrades,aes(x=cement,y=strength)) +
  geom_point(aes(col=factor(age),size=ash)) +
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap( ~ grades, nrow=3)

ggplot(olderThan28DayswithGrades) + geom_bar(aes(x = grades))



