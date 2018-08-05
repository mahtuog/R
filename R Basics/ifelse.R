age = 29
education = "UG"
status = "single"

print("Welcome to aussie visa selection")

if(age <= 35 && status == "married" && education == "PG"){
  print("Candidate is selected")
} else if(age > 35){
  print("candidate is rejected becauese he is old!")
} else if(status != "married"){
  print("candidate is not selected as he is not married")
} else if(education != "PG") {
  print("Only PG students are allowed!")
}