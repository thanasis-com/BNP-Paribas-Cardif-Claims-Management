require("e1071")
require("LiblineaR")

#train the svm
time<-system.time({
  svm.model<-svm(x=trainNumeric[,3:114], y=trainNumeric[,2], scale=TRUE, kernel="linear", cost=1,  probability = TRUE)
})

######################
#train svm with linear kernel
traintimelinear<-system.time({
  svmlinear<-LiblineaR(data=trainNumeric[,3:114], labels=trainNumeric[,2], type=1, cost=1)
})

#make predictions with linear kernel svm
results<-predict(svmlinear, testNumeric[,2:113], type="response")

#produce csv
submission<-cbind(testNumeric$ID,results)
colnames(submission) <- c("ID", "PredictedProb")
write.csv(submission, file = "submission.csv", row.names=FALSE)
