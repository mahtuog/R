# mice is used to impute missing values in datasets
# first remove all the rows with missing values in a column
# with the left over data , see if there is a relation between the col and other columns
# then come back to the original and try to impute the value based on the correlations

library(mice)

data = airquality
summary(data)

data[4:10,3] = rep(NA,7)
data[1:5,4] = NA
head

summary(data)

pMiss = function(x)(sum(is.na(x))/length(x)*100)

apply(data,2,pMiss)

#md = missing data
md.pattern(data)


marginplot(data[c(1,2)])


#~~~~~~~~Homework~~~~~~~~~~~~~~#
# #find out other methods available in mice apart from pmm
# which method to use when

tempData = mice(data,m=5,maxit = 50,meth ='pmm',seed=500 )

tempData$imp$Ozone

completeData = complete(tempData,5)

xyplot(tempData,Ozone ~ Wind+Temp+Solar.R,pch=18,cex=1)

densityplot(tempData)





