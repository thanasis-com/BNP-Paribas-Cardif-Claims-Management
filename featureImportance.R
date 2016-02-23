library(doSNOW)
library(caret)

cl <- makeCluster(8)
registerDoSNOW(cl)

# prepare training scheme
control <- trainControl(method="none")
# train the model
model <- train(as.factor(target)~., data=trainNumeric[,2:114], method="lvq", preProcess="scale", trControl=control)

stopCluster(cl)

# estimate variable importance
importance <- varImp(model, scale=FALSE)
# summarize importance
print(importance)
# plot importance
plot(importance)



# ensure the results are repeatable
set.seed(7)
# load the library
library(mlbench)
library(caret)

# define the control using a random forest selection function
control <- rfeControl(functions=rfFuncs, method="cv", number=2)
# run the RFE algorithm
results <- rfe(trainNumeric[,3:10], as.factor(trainNumeric[,2]), sizes=c(1:8), rfeControl=control)
# summarize the results
print(results)
# list the chosen features
predictors(results)
# plot the results
plot(results, type=c("g", "o"))



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
