# Basic operations in dplyr include
# filter() – to pick certain observations based on value
# arrange() – to reorder rows 
# select() – to pick variables by names
# mutate()  - create new variables
# summarize() – collapse many observations into one


library(nycflights13)
library(dplyr)
head(flights) #this is a tibble - s4 class

#filter :: filter(df,colvalue=,colvalue=)
jan_flights = filter(flights,month==1,day==1)
count_jan_flights = as.integer(count(jan_flights))
janORdec = filter(flights, month %in% c(1,12))

dec_fligths = filter(flights, month==12)


mayORjan = filter(flights, month %in% c(1,5))


distinct_df = mayORjan %>% distinct(month)

summary(mayORjan)

#arrange - default ascending
arrange(mayORjan,desc(month),year,day)


#select
flights_ymd = select(flights,year,month,day)

# how to do this ? = select and filter in one line

flights_ymd_dec = select(flights, year, month,day) %>% filter(month==12,day==1)


flight_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)

mutated_flights = mutate(flight_sml, gain = arr_delay - dep_delay,  speed = distance / air_time *60)

summary(mutated_flights)

transmuted_flights = transmute(flight_sml, gain = arr_delay - dep_delay,  speed = distance / arr_time *60)  


#summarize - get the mean of delays in flights after removing na's
summarize(flights,delay=mean(dep_delay,na.rm=TRUE))

#group by - not a part of dplyr
by_month = group_by(flights,year,month)

summarize(by_day,delay=mean(dep_delay,na.rm=TRUE))


