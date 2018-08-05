a = "Hi"
b = "Good Morning"

c = paste(a,b,sep = "#")

print(c)

#function to concatenate any number of strings
concat = function(...){
  c = paste(...,sep=" ")
  return(c)
}

combined_string = concat("hello","are","you?")
print(combined_string)


#string manipulation
a = "Goutham"
nchar(a)
toupper(a)
tolower(a)

#characters ignoring spaces
string = "Hello How Are you"

white_spaces = stringr::str_count(string," ")
cat("number of white spaces",white_spaces)

character_count = stringr::str_count(string,"[^\\s]")
cat("number of characters",character_count)

#function calling function
inner_function = function(){
  print("inside inner function")
}
outer_function = function(){
  print("inside outer function")
  print("calling inner function")
  inner_function()
}
outer_function()
