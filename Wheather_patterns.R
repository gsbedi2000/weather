#Project: weather patterns


getwd()
#windows 
setwd("C:\\Data_sci2017\\Advanced - R\\hw4\\Weather Data")
#setwd(".\\Weather Data")
#C:\\Data_sci2017\\Advanced - R\\hw3

getwd()

Chicago<- read.csv("Chicago-F.csv", row.names=1)
Chicago

Houston<- read.csv("Houston-F.csv", row.names=1)
Houston

NewYork<- read.csv("NewYork-F.csv", row.names=1)
NewYork

SanFrancisco<- read.csv("SanFrancisco-F.csv", row.names=1)
SanFrancisco

#check these if they are dataframe
is.data.frame(Chicago)
Chicago <- as.matrix(Chicago)
Houston <- as.matrix(Houston)
NewYork <- as.matrix(NewYork)
SanFrancisco <- as.matrix(SanFrancisco)

is.matrix(Chicago)

#let's put all of these in a list

weather <- list(Chicago=Chicago, Houston=Houston, NewYork=NewYork, SanFrancisco=SanFrancisco)
weather
weather[3]
weather[[3]]
weather$Houston

# Raju made a change

#Using apply()

?apply
Chicago
apply(Chicago, 1, mean)
mean(Chicago["DaysWithPrecip",])

#analyze one city:

apply(Chicago, 1, max)
apply(Chicago, 1, min)

# for practice

apply(Chicago, 2, max)
apply(Chicago, 2, min)

apply(Chicago, 1, mean)
apply(Houston, 1, mean)
apply(NewYork, 1, mean)
apply(SanFrancisco, 1, mean)

# recreating the apply function with loops (advanced topic)

Chicago
#find the mean of every row:
 #1 via loops.

output <- NULL #preparing the value for data
for (i in 1:5)
{
output[i] <- mean(Chicago[i,])
}
names(output) <- rownames(Chicago)
output

# 2 Via Apply 

apply (Chicago, 1, mean)


# using lapply 

?lapply

Chicago 
t(Chicago)
weather
lapply(weather, t)
mynewlist <- lapply(weather, t)
mynewlist

# example 2

Chicago
 
rbind(Chicago, newrow=1:12) 
lapply(weather, rbind,newrow=1:12)

# example 3
?rowMeans
rowMeans(Chicago)
lapply(weather, rowMeans)

#(nearly) deliv 1: even better but will improve further

# rowMeans 
# colMeans 
# rowSums
# colSums

#combining lapply with []

weather
weather[[1]][1,1]
weather$Chicago[1,1]

lapply(weather, "[", 1,1)
lapply(weather, "[", 1,)

lapply(weather, "[", ,3)

# adding your own functions

lapply(weather, rowMeans)

lapply(weather, function(x) x[1,])
lapply(weather, function(x) x[5,])
lapply(weather, function(x) x[,12])

lapply(weather, function(z) z[1,]-z[2,])
lapply(weather, function(z) (z[1,]-z[2,])/z[2,])

lapply(weather, function(z) round((z[1,]-z[2,])/z[2,], 2))
#(nearly) deliv 2: temp functions will improve further

# using sapply 

?sapply

weather
# AvgHigh_F for July
lapply(weather,"[", 1,7)
sapply(weather,"[", 1,7)
# AvgHigh_F for 4th quarter
lapply(weather,"[", 1,10:12)
sapply(weather,"[", 1,10:12)

#Another example 

lapply(weather, rowMeans)
round(sapply(weather, rowMeans),2) #deliv 1

sapply(weather, function(z) round((z[1,]-z[2,])/z[2,], 2)) #deliv 2

#nesting apply() functions
weather
lapply(weather, rowMeans)
Chicago
apply(Chicago,1, max)
lapply(weather, apply,1, max)

lapply(weather, function(x) apply(x,1,max))

sapply(weather, apply,1, max)   
sapply(weather, apply,1, min)   

# Which.max() and Which.min() (advanced topic)

?Which.max
Chicago[1,]
which.max([1,])
names(which.max(Chicago[1,]))

# by the sounds of it:
# we will have: appply - to iterate over the matrix
#and we will have: lappy or sapply to iterate over components of the list

# we will have: appply - to iterate over the matrix
apply(Chicago, 1, function(x)names(which.max(x)))

lapply(weather, function(y)apply(y, 1, function(x)names(which.max(x))))

sapply(weather, function(y)apply(y, 1, function(x)names(which.max(x))))
