#random forest with ranger package (fast)
library(ranger)

model<-ranger(as.factor(target)~., data=train[,2:125], num.trees = 500, probability = TRUE,  write.forest = TRUE)

#make predictions
results <- predict(model, test[,2:124], type="prob")

#produce csv
submission<-cbind(test$ID,results$predictions[,2])
colnames(submission) <- c("ID", "PredictedProb")
write.csv(submission, file = "submission.csv", row.names=FALSE)