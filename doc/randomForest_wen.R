
feature_train = as.matrix(dat_train[, -6007])
label_train = as.integer(dat_train$label) 

feature_test <- as.matrix(dat_test[, -6007])
label_test <- as.integer(dat_test$label)


library(randomForest)

mtvals=c(100,500,1000,2000,3000)

fitacc=c()
testacc=c()

count=1
while(count<=length(mtvals)){
  rf_classifier = randomForest(label ~ ., data=dat_train, ntree=100, mtry=2000)#, importance=TRUE)
  preds=predict(rf_classifier,dat_test[,-6007],type="class")
  # table(rf_classifier$predicted, dat_train$label)
  # table(preds, dat_test$label)
  fit=sum(rf_classifier$predicted==dat_train$label)/length(dat_train$label)
  test=sum(preds==dat_test$label)/length(dat_test$label)
  fitacc=c(fitacc, fit)
  testacc=c(testacc, test)
  print(count)
  count=count+1
}


df=data.frame(rf_classifier$importance)
imp1=rownames(df)[order(df$MeanDecreaseAccuracy, decreasing = T)[1:1000]]
imp2=rownames(df)[order(df$MeanDecreaseGini, decreasing = T)[1:1000]]
allimp=unique(c(imp1, imp2))
impinds=unlist(lapply(allimp, function(x){as.numeric(strsplit(x, "feature")[[1]][2])}))
# varImpPlot(rf_classifier)

newtrain=dat_train[,c(impinds, ncol(dat_train))]
rf_classifier = randomForest(label ~ ., data=newtrain, ntree=100, mtry=2, importance=TRUE)

newtest=dat_test[,c(impinds, ncol(dat_test))]
preds=predict(rf_classifier,dat_test[,-6007],type="class")

