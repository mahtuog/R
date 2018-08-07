#Binomial Distribution

#binomial distributin with probability values
px = dbinom(c(0:7),size = 7,prob = 0.6)
print(px)
plot(x=c(0:7),px,type="b")

#cumulative probability for binomial dist
cx = pbinom(c(0:7),size = 7,prob = 0.6)
plot(c(0:7), cx, type="b")

x = c(0:7)
px = dbinom(x,size = 7,prob = 0.6)
cx = pbinom(x,size = 7,prob = 0.6)

df <- data.frame(x,px,cx)
print(px)

# 12 questions , answers at random , what is the probability 
# that the student has 4 or less correct answers when he 
# answers at random
x = c(0:12)
cx = pbinom(x,size = 12,prob = 0.2)



