dx = dpois(c(0:10),lambda = 3)
cx = ppois(c(0:10) , lambda = 3)

plot(c(0:10), dx, type="b")
plot(c(0:10), cx, type="b")

x_lab = c(0:10)

df <- data.frame(x_lab,dx,cx)
df

ggplot(df, aes(x_lab)) + geom_point(aes(x=x_lab,y=dx)) +
  geom_point(aes(x=x_lab,y=cx)) 

val = c()
x = c(1:12)
for(i in x){
  val[i] = dpois(i,lambda = 3)
}




