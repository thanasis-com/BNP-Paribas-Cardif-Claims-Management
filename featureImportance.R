library(doSNOW)
library(caret)

# ensure the results are repeatable
set.seed(7)
# load the library
library(mlbench)
library(caret)

# calculate correlation matrix
correlationMatrix <- cor(trainNumeric[,3:114])
# summarize the correlation matrix
print(correlationMatrix)
# find attributes that are highly corrected (ideally >0.75)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.75,  names = TRUE, verbose = TRUE)
# print indexes of highly correlated attributes
print(highlyCorrelated)
