myfunc = function(a){
  i = 1
  while( i <= a){
    print("Hello")
    i = i + 1
  }
}

myfunc(10)


#Function for squares
squaresNumber = function(a){
  print(a*a)
}

squaresNumber(5)

#functions without arguments
greetings = function(){
  print("hello World!")
}
greetings()



#function to increment numbers
increment_numbers = function(a){
  for(i in a){
    a[i] = a[i] + 3
  }
  return(a)
}
a = c(1:10)

new_x = increment_numbers(a)
print(new_x)


#passing variable number of arguments
neo = function(...){
  myl = list(...)
  print(myl)
}

neo(1,2,3,4,5)

