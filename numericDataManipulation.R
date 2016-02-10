require("dplyr")
require("plyr")

#explore missing values
sapply(train,function(x) sum(is.na(x)))

#Getting rid of the categorical variables of the train set
numeric_columns <- sapply(train, is.numeric)
trainNumericNA<-train[,numeric_columns]

#Getting rid of the categorical variables of the test set
numeric_columns <- sapply(test, is.numeric)
testNumericNA<-test[,numeric_columns]

######Dealing with missing values in the train dataset
#Split the dataset into to datasets, according to class
train0<-filter(trainNumericNA, target==0)
train1<-filter(trainNumericNA, target==1)

#Replace NA values with the mean of each column for each dataset
for (i in which(sapply(train0, is.numeric))) {
  train0[is.na(train0[, i]), i] <- mean(train0[, i],  na.rm = TRUE)
}
for (i in which(sapply(train1, is.numeric))) {
  train1[is.na(train1[, i]), i] <- mean(train1[, i],  na.rm = TRUE)
}

#Bind the datasets and order by ID
trainNumeric<-rbind(train0, train1)
trainNumeric<-trainNumeric[order(trainNumeric$ID), ]
rownames(trainNumeric) <- NULL
######

######Dealing with missing values in the test dataset
for (i in which(sapply(testNumericNA, is.numeric))) {
  testNumericNA[is.na(testNumericNA[, i]), i] <- mean(testNumericNA[, i],  na.rm = TRUE)
}
testNumeric<-testNumericNA
######
