#read ggplot by wickham

library(tidyverse)
ggplot()

car_mpg = read.csv("car-mpg.csv",stringsAsFactors = FALSE)
#ggplot(data=autodf)+ geom_point(mapping= aes(x = wt, y= mpg, color=origin))
#geom_point - geometriical poing - use points to represents
#aes - aesthetics - look of the plot


ggplot(data=car_mpg)+ geom_point(mapping= aes(x = wt, y= mpg, color=origin))

summary(car_mpg)

lapply(car_mpg,class)

car_mpg$origin = as.factor(car_mpg$origin)

car_mpg$cyl = factor(car_mpg$cyl , levels=c(3,4,5,6,7,8), labels=c("3cyl","4cyl","5cyl","6cyl","7cyl","8cyl"))

ggplot(data=car_mpg)+ geom_point(mapping= aes(x = wt, y= mpg, color=cyl,size=cyl))


#facet plot - splits the data based on cylinders = ~ means facet is a function of cyl
ggplot(data=car_mpg)+ geom_point(mapping= aes(x = wt, y= mpg, color=origin)) + facet_wrap(~ cyl,nrow=2)



#smooth plot
ggplot(data=car_mpg)+ geom_smooth(mapping= aes(x = wt, y= mpg, linetype=origin))
#gray band represents the standard deviation


#box plots using ggplot
ggplot(data = car_mpg, aes(x=cyl, y=wt, fill=cyl)) + geom_boxplot()
#as number of cylinders inc weight increases
#q2 represents median - if q2 is in center of q1 and q2, it means symmetric distribution
 
