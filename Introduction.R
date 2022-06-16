
# Vectors
x = c(4, 5, 6)
x[1]
x[2:3]
x[-2]
x[-c(1,2)]

# Matrix
z = matrix(seq(1, 12),4,3)
z[3:4, 2:3]
dim(z)

x=runif(50)
y=rnorm(50)
plot(x, y)

par(mfrow=c(2,1)))
plot(x,y)
hist(y)
par(mfrow=c(1,1)))

# Reading data
Auto = read.csv('data/Auto.data')
dim(Auto)
