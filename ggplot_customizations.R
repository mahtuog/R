midwest <- read.csv("http://goo.gl/G1K41K")
library(tidyverse)
library(ggplot2)

#base plot
theme_set(theme_grey())

gg <- ggplot(midwest,aes(x=area,y=poptotal)) + 
  geom_point(aes(col=state,size=popdensity)) + 
  coord_cartesian(xlim=c(0,0.1),ylim=c(0,1000000)) +
  labs(title="Area Vs Population",x="Area",y="Total Population")
  #scale_color_brewer(palette="Set1")

plot(gg)

#FACETS 
mpg <- read.csv("http://goo.gl/uEeRGu")

gg <- ggplot(mpg, aes(y=hwy,x=displ)) +
  geom_point(aes(col=class)) + geom_smooth(method="lm",se=FALSE) + theme_bw() +
  labs(title="hwy vs disp",x="displacement",y="hwy",caption="Source: mpg") +
  scale_color_brewer(palette="Set1")

plot(gg)

# WHAT IF YOU WANTED EVERY CLASS IN A SEPARATE PLOT, 
# IT CAN BE USEFUL FOR BREAKING A LARGE DATASET DOWN

#creates the base plot with scatter and line

gg <- ggplot(mpg, aes(x=displ, y=hwy)) +
  geom_point() + geom_smooth(method="lm",se=FALSE) +
  theme_bw() +
  labs(title="hwy vs disp",x="displacement",y="hwy",caption="Source: mpg") +
  scale_color_brewer(palette="Set1")

# add facets to this based on 
# rows ~ cols
gg2 <- gg + facet_wrap( ~ class,nrow = 3)
plot(gg2)

#facet grid
gg3 <- gg + facet_grid(manufacturer ~ class)
plot(gg3)

gg4 <- gg + facet_grid(cyl ~ class)
plot(gg4)

library(gridExtra)

grid.arrange(gg3,gg4,ncol=2)