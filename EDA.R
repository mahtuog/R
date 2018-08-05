#loading the csv file
#set stringasfactors to false to make R not convert strings to factors
#if file has some other separator then give sep=""

wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)
head(wbcd)

# you can read excel sheet using readWorksheetFromFile()

#data can be read from RDBMS too using drivers

#ALWAYS READ THE METADATA

# LOOK AT THE TARGET COLUMN - see if they are equally represented
# accuracy may go down in predicting the value which is less represented - RISK

#Question every attribute - do it for every columns - see the range

#dont drop the id columns right away - sort your data on id cols and check for 
#missing values

#population and sample - population is everything , sample is what is given to you
#sample should represnt the population as much as possible
#sample should capture all variances in the populatoin
#make sure you are not given biased data

#if there is missing data - see if its missing at random
#or its missing because of some reason
#data can be imputed using statistics if its missing at random


#DONT SPOIL THE SANCTITY OF THE ORIGINAL DATASET

#~~~~~~~~~~~~HOMEWORK~~~~~~~~~~~~~~~~~~~~~~~~~~#
#EXPLORE THE UCI BC Dataset
#MICE PACKAGE - in R - replace missing values with estimated values 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#histogram - data is split into bins
hist(wbcd$radius_mean)

#understading one column at a time is called univariate analysis


#LEVERAGE POINTS - outliers which are not visible during univariate analysis - 
#they are only visible during bi / multivariate analysis

#pysch library

car_mpg = read.csv("car-mpg.csv",stringsAsFactors = FALSE)
head(car_mpg)


#ALWAYS CHECK DATATYPES
lapply(car_mpg,class)

#gives statistical information about the dataframe
summary(car_mpg)

#~~~~~~~~~~~~central tendencies~~~~~~~~~~~~~~~~~~#

# mean , meadian , mode
# mean = average - represents all the data points which went into calculating the value
#        average is affected by extreme values min and max , when extreme value 
#        changes a lot , average is also affected.
# median = physical or central average (Q2 - Quartile 2) (middle value)
#
# MEDIAN IS MORE STABLE THAN MEAN


# 5.07
# 5.08
# 5.09 -- Q1 (1st quartile)
# 5.10
# 5.10 -- Q2 (median)
# 5.10
# 5.11
# 5.11 -- Q3 (3rd quartile)
# 5.11
# 6.00


# if mean is greater than median , tail is longer on right
# more the gap between mean and median , longer is the tail , more outliers 


#displays all the records which are polluted
subset(car_mpg,is.na(as.numeric(hp)))


car_mpg$car_type = factor(car_mpg$car_type, levels=c(0,1), labels=c("Automatic","Manual"))
car_mpg$origin = factor(car_mpg$origin, levels=c(0,1,2), labels=c("Americas","Europe","Asia"))
car_mpg$cyl = factor(car_mpg$cyl , levels=c(3,4,5,6,7,8), labels=c("3cyl","4cyl","5cyl","6cyl","7cyl","8cyl"))



car_mpg$hp = as.numeric(car_mpg$hp)
sum(is.na(car_mpg$hp))

subset(car_mpg,car_mpg$car_type=="Automatic")

median(car_mpg$hp,na.rm=T)

car_mpg$hp[is.na(car_mpg$hp)] = median(car_mpg$hp,na.rm=T)

summary(car_mpg)

car_mpg = car_mpg[,-10]

pairs.panels(car_mpg[c("mpg","cyl","disp","hp","wt","acc","yr","origin","car_type")])

hist(car_mpg$hp,main="HP HISTOGRAM",xlab="hp")


boxplot(car_mpg$hp , horizontal = T)
# outliers,whisker1,q1,q2,q3,whisker2,outliers
# q3 - q1 = iqr * 1.5





