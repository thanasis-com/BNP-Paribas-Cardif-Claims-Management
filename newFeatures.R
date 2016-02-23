#creating new features
#For every feature with missing values,
#create a categorical feature with TRUE or FALSE values to describe the existance of a value or not for the specific observation
#TRUE means that the value is missing

require("dplyr")

#importing data
test = read.csv("test.csv", header = TRUE)
train = read.csv("train.csv", header = TRUE)


counter<-0
for(i in 3:ncol(train))
{
  if(sum(is.na(train[i]))>0 || sum(train[i]=="")>0)
  {
    counter<-counter+1
    varname<-paste0("m", names(train[i]))
    train[[varname]] <- with(train, as.factor(paste0((is.na(train[i]) | train[i]==""))))
  }
}
print(paste0(counter, " new features created"))

counter<-0
for(i in 2:ncol(test))
{
  if(sum(is.na(test[i]))>0 || sum(test[i]=="")>0)
  {
    counter<-counter+1
    varname<-paste0("m", names(test[i]))
    test[[varname]] <- with(test, as.factor(paste0((is.na(test[i]) | test[i]==""))))
  }
}
print(paste0(counter, " new features created"))



