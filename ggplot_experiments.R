midwest <- read.csv("http://goo.gl/G1K41K")

options(scipen=999)

# used to initialize the ggplot
# aes specifies x and y axes
# geom point gives scatter plot 
# geom smooth gives a line , in this case linear model
g <- ggplot(data = midwest, aes(x=area,y=poptotal)) + geom_point() +
   geom_smooth(method = "lm", se = FALSE)

plot(g)

#can be used to view the best fit line after removing outliesrs
g1 <- g + xlim(c(0,0.1)) + ylim(c(0,1000000))
plot(g1)

#original line can be preserved using coord_cartesian
g2 <- g + coord_cartesian(xlim = c(0,0.1) ,ylim = c(0,1000000))
plot(g2)

g1 <- g + labs(title="Midwest Data",x="Area",y="Total Population",
               subtitle="From midwest dataset",caption="Midwest demographics")
plot(g1)


#ALL IN ONE
ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(col="steelblue") + 
  geom_smooth(method = "lm",se = FALSE,col="firebrick") + coord_cartesian(xlim = c(0,0.1) ,ylim = c(0,1000000)) +
  labs(title="Midwest data",x="Area",y="Population",subtitle="from midwest data",
  caption = "MIdwest demographics")



#color based on a different column, give the col name inside aes
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point(aes(col=state)) + 
  geom_smooth(method = "lm",se = FALSE,col="firebrick") + coord_cartesian(xlim = c(0,0.1) ,ylim = c(0,1000000)) +
  labs(title="Midwest data",x="Area",y="Population",subtitle="from midwest data",
       caption = "MIdwest demographics")



#change color palette

gg + scale_color_brewer(palette = "Set1") + scale_x_reverse()

#ALL color palettes can be seen with this package
library(RColorBrewer)
head(brewer.pal.info,10)

#reverse x axis 
gg + scale_color_brewer(palette = "Set1") + scale_x_reverse()


#scaling the x and y axis and customizing the text
gg + scale_color_brewer(palette = "Set1") + 
  scale_y_continuous(breaks=seq(0,1000000,200000),
                     labels = function(x){paste0(x/1000,'K')})



