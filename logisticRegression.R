#Fit a logistic regression model
model<-glm(target~., family=binomial(link='logit'), data=trainNumeric[,-1])

#examine the model
summary(model)
anova(model, test="Chisq")

#make predictions
results<-data.frame(predict(model, newdata=testNumeric[,2:113], type='response'))

#produce csv
submission<-cbind(testNumeric$ID,results[,1])
colnames(submission) <- c("ID", "PredictedProb")
write.csv(submission, file = "submission.csv", row.names=FALSE)