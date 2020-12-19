
# 1.1

library(readxl)
spamdata = read_excel("spambase.xlsx")

# divide data
n = dim(spamdata)[1]
set.seed(12345)
id = sample(1:n, floor(0.5*n))
train = spamdata[id,]
test = spamdata[-id,]

#1.2

# model 
model = glm(Spam ~ ., family = "binomial", data = train)

# predict and test 

logisticTest = function(p){
  ypred = predict(model, newdata = test, type = "response")
  ypred1 = ifelse(ypred > p, 1,0)
  confMat = table(test$Spam, ypred1)
  misclass = 1 - sum(diag(confMat))/sum(confMat)
  return(misclass)
}

cat("\n\nFor the classification principle 0.5, the misclassification error rate: "
    ,logisticTest(0.5))


#1.3

cat("\nFor the classification principle 0.8, the misclassification error rate: ",
    logisticTest(0.8))

#1.4
# knn classification
library(kknn)
knnModel = function(k){
  modelKnn = kknn(as.factor(Spam) ~ ., train = train, test = test, k = k)
  confMat = table(modelKnn$fitted.values, test$Spam)
  misclass = 1 - sum(diag(confMat))/sum(confMat)
  return(misclass)
}

cat("For k = 30, the misclassification error rate is",knnModel(30))

#1.5
cat("For k = 1, the misclassification error rate is",knnModel(1))




