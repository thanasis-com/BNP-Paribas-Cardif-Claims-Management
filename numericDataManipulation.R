require("dplyr")
require("plyr")

#import data
test = read.csv("test.csv", header = TRUE)
train = read.csv("train.csv", header = TRUE)


#explore missing values
sapply(train,function(x) sum(is.na(x)))

#Getting rid of the categorical variables of the train set
numeric_columns <- sapply(train, is.numeric)
trainNumericNA<-train[,numeric_columns]

#Getting rid of the categorical variables of the test set
numeric_columns <- sapply(test, is.numeric)
testNumericNA<-test[,numeric_columns]

# ######Dealing with missing values in the train dataset
# #Split the dataset into to datasets, according to class
# train0<-filter(trainNumericNA, target==0)
# train1<-filter(trainNumericNA, target==1)
# 
# #Replace NA values with the mean of each column for each dataset
# for (i in which(sapply(train0, is.numeric))) {
#   train0[is.na(train0[, i]), i] <- median(train0[, i],  na.rm = TRUE)
# }
# for (i in which(sapply(train1, is.numeric))) {
#   train1[is.na(train1[, i]), i] <- median(train1[, i],  na.rm = TRUE)
# }
# 
# #Bind the datasets and order by ID
# trainNumeric<-rbind(train0, train1)
# trainNumeric<-trainNumeric[order(trainNumeric$ID), ]
# rownames(trainNumeric) <- NULL
# ######

######Dealing with missing values in the test dataset
for (i in which(sapply(testNumericNA, is.numeric))) {
  testNumericNA[is.na(testNumericNA[, i]), i] <- median(testNumericNA[, i],  na.rm = TRUE)
}
testNumeric<-testNumericNA
######

######Dealing with missing values in the train dataset
for (i in which(sapply(trainNumericNA, is.numeric))) {
  trainNumericNA[is.na(trainNumericNA[, i]), i] <- median(trainNumericNA[, i],  na.rm = TRUE)
}
trainNumeric<-trainNumericNA
######

#Scale the train and test sets
#trainNumeric<-cbind(trainNumeric[,c(1,2)],scale(trainNumeric[,-c(1,2)]))
#testNumeric<-data.frame(cbind(testNumeric[,c(1)],scale(testNumeric[,-c(1)])))
#colnames(testNumeric)[1]<-'ID'
