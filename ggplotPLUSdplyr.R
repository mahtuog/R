

# find out if delays is dependent on the distance the flight has to cover
by_dest = group_by(flights,dest)

delay = summarize(by_dest,count=n(),dist=mean(distance,na.rm=TRUE),delay=mean(arr_delay,na.rm=TRUE))

delay = filter(delay,count>20,dest != "HNL")

ggplot(data=delay, mapping=aes(x= dist, y=delay)) + geom_point(aes(size=count),alpha=1/3) + geom_smooth(se=F)