require("caret")
library(doSNOW)

cl <- makeCluster(8)
registerDoSNOW(cl)

# define training control
train_control <- trainControl(method="cv", number=5, classProbs = TRUE)

#train the model
time<-system.time({
  train[,2][train[,2]==1] <- "yes"
  train[,2][train[,2]==0] <- "no"
  model <- train(x=train[,3:129], y=as.factor(train[,2]), trControl=train_control, method="rpart")
  
})

stopCluster(cl)

#model summary
print(model)

#make predictions
results <- predict(model, test[,2:128], type="prob")

#produce csv
submission<-cbind(test$ID,results$yes)
colnames(submission) <- c("ID", "PredictedProb")
write.csv(submission, file = "submission.csv", row.names=FALSE)

