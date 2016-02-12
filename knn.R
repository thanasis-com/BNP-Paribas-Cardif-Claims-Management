require("kknn")
#Train KNN
model<-kknn(target~., train=trainNumeric[,2:114], test=testNumeric[,2:113], k=17,  kernel="rectangular")



#produce csv
submission<-cbind(testNumeric$ID,model$fitted.values)
colnames(submission) <- c("ID", "PredictedProb")
write.csv(submission, file = "submission.csv", row.names=FALSE)

