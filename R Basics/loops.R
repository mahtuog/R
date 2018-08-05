for(i in c(1:15)) {
  if(i%%2 != 0){
    cat(i," hello earth\n")
  }
  #print("hello")
  if(i%%2 == 0){
    cat(i," hello world\n")
  }
}

for(i in c("hello","how","are",c(1:10),"you")){
  print(i)
}


for(i in c("helo","how","are","you")){
  print(i)
}



#SPECIAL LOOPS
# apply()
# lapply() - loop apply - inbuilt for...next
# sapply()

#first 30 odd numbers

for(i in c(1:60)){
  if(i%%2 != 0){
    print(i)
  }
}


count = 0
i = 1
while(count<30){
  i = i + 1
  if(i %%2 != 0){
    print(i)
    count = count + 1
  }
}



#repeat loop

i = 123
repeat{
  print(i%%10)
  if(i <= 0) {break}
  i = i %/% 10
}




#first 20 numbers divisible by 5
i = 15000
count = 0
repeat{
  if(i%%5 == 0){
    count = count+1
    print(i)
  }
  i = i + 1
  if(i == 17896) {break}
}
print(count)


#fibonacci
a=0
b=1
count=0
print(a)
print(b)
repeat{
  count = count + 1
  c = a+b
  print(c)
  a = b
  b = c
  if(count == 10){break}
}


#nested loops
for(i in c(1:3)){
  for(j in c(1:5)){
    cat(j," ")
  }
  cat("\n")
}


#nested loops modified
for(i in c(1:5)){
  for(j in c(5:1)){
    cat(j," ")
  }
  cat("\n")
}

i = 9
while(i > 0){
  j = 0
  while(j<3){
    cat(i," ")
    i = i - 1
    j = j + 1
  }
  cat("\n")
}

