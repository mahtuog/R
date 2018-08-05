carsDF = mtcars

weightInLBS = function(a){
  a = a*1000
}

dispInCCs = function(a){
  a = round(a*16.538)
}

powerByWeight = function(a,b){
  c = round(a/b,digits=3)
}

mileageKMPL = function(a){
  a = round(a*0.425, digits=2)
}

newData = subset(carsDF,select = c("mpg","wt","disp","hp"))

newData$KMPL = unlist(lapply(newData$mpg, mileageKMPL))
newData$wt = unlist(lapply(newData$wt, weightInLBS))
newData$disp = unlist(lapply(newData$disp, dispInCCs))
newData$power_weight_ratio = unlist(mapply(powerByWeight, newData$hp,newData$wt))



final_data = subset(newData,newData$disp>2500,select=c(disp,power_weight_ratio,KMPL))
final_data_ordered = final_data[order(unlist(final_data$disp)),]

write.csv(final_data_ordered,file = "assignment_output.csv")
