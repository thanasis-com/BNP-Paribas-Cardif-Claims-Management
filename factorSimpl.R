
factorSimpl<-function(x)
{
  #takes a column as input
  for(i in 1:length(x))
  {
    if(x[i]!="")
    {
      value<-strsplit(paste0(x[i]),"")[[1]][1]
      x[i]<-value
    }
  }
  return(x)
}

test$v113<-factorSimpl(test$v113)
train$v113<-factorSimpl(train$v113)
test$v125<-factorSimpl(test$v125)
train$v125<-factorSimpl(train$v125)




