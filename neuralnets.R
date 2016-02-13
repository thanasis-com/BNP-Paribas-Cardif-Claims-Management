require("RSNNS")
#train the network

time<-system.time({
  model<-mlp(trainNumeric[,3:114], trainNumeric[,2], size=c(150), maxit=300,
                        initFunc = "Randomize_Weights", initFuncParams = c(-0.3, 0.3),
                        learnFunc = "Std_Backpropagation", learnFuncParams = c(0.1, 0.0),
                        updateFunc = "Topological_Order",updateFuncParams = 0.0,
                        hiddenActFunc = "Act_Logistic"
  )
})



