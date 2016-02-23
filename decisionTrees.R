require("caret")
library(doSNOW)

cl <- makeCluster(8)
registerDoSNOW(cl)

# define training control
train_control <- trainControl(method="none", classProbs = TRUE)

#train the model
time<-system.time({
  trainNumeric[,2][trainNumeric[,2]==1] <- "yes"
  trainNumeric[,2][trainNumeric[,2]==0] <- "no"
  set.seed(123)
  model <- train(x=trainNumeric[,3:114], y=as.factor(trainNumeric[,2]), trControl=train_control, method="ranger")
  
})

stopCluster(cl)

#model summary
print(model)

plot(model$finalModel)
text(model$finalModel)

#make predictions
results <- predict(model, test[,2:113], type="prob")

#produce csv
submission<-cbind(test$ID,results$yes)
colnames(submission) <- c("ID", "PredictedProb")
write.csv(submission, file = "submission.csv", row.names=FALSE)

