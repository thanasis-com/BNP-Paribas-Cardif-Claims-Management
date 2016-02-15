require("RSNNS")
#train the network

time<-system.time({
  model<-mlp(trainNumeric[,3:114], trainNumeric[,2], size=c(120,120,120), maxit=100,
                        initFunc = "Randomize_Weights", initFuncParams = c(-0.1, 0.1),
                        learnFunc = "Std_Backpropagation", learnFuncParams = c(0.005, 0.1),
                        updateFunc = "Topological_Order",updateFuncParams = 0.0,
                        hiddenActFunc = "Act_Logistic"
  )
})

#plot the iterative error
plotIterativeError(model)

#make predictions
results<-predict(model, testNumeric[,2:113], type="response")

#produce csv
submission<-cbind(testNumeric$ID,results[,1])
colnames(submission) <- c("ID", "PredictedProb")
write.csv(submission, file = "submission.csv", row.names=FALSE)

