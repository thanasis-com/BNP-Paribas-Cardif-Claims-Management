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

#have to remove it to use the randomForest package, because it has more than 53 levels
test$v125<-NULL
train$v125<-NULL


#####Dealing with missing values in the test dataset
for (i in which(sapply(test, is.numeric))) {
  test[is.na(test[, i]), i] <- median(test[, i],  na.rm = TRUE)
}

######

######Dealing with missing values in the train dataset
for (i in which(sapply(train, is.numeric))) {
  train[is.na(train[, i]), i] <- median(train[, i],  na.rm = TRUE)
}

######
