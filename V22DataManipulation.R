#import data
#getting rid of V22 as it has different levels in train and test set

test = read.csv("test.csv", header = TRUE)
train = read.csv("train.csv", header = TRUE)

test$v22<-NULL
train$v22<-NULL
test$v56<-NULL
train$v56<-NULL
test$v71<-NULL
train$v71<-NULL
test$v113<-NULL
train$v113<-NULL