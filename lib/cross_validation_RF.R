########################
### Cross Validation ###
########################

### Author: Chengliang Tang
### Project 3
#source("C:/Users/yinwe/OneDrive/Desktop/Columbia-class/Applied Data Science/New folder (4)/Fall2020-Project3-group1/lib/train_RF.R") 
#source("C:/Users/yinwe/OneDrive/Desktop/Columbia-class/Applied Data Science/New folder (4)/Fall2020-Project3-group1/lib/test_RF.R") 

cv.function <- function(features, labels, K, ntree, mtry){
  ### Input:
  ### - features: feature data frame
  ### - labels: label data vector
  ### - K: a number stands for K-fold CV
  ### - l: tuning parameters 
  ### - reweight: sample reweighting 

  set.seed(2020)
  n <- dim(features)[1]
  n.fold <- round(n/K, 0)
  s <- sample(n) %% K + 1
  cv.error <- rep(NA, K)
  cv.AUC <- rep(NA, K)
  #reweight <- FALSE
  for (i in 1:K){
    ## create features and labels for train/test
    feature_train_cv <- features[s != i,]
    feature_test_cv <- features[s == i,]
    label_train_cv <- labels[s != i]
    label_test_cv <- labels[s == i]
    
    #label_train_cv <- ifelse(label_train_cv == 2, 1, 2) #flip
    #df = ubBalance(X = feature_train_cv, Y = as.factor(label_train_cv), type="ubSMOTE")
    
    ## model training
    model_train <- train_RF(feature_train_cv, label_train_cv, ntree=ntree, mtry=mtry)
    
    ## make predictions
    label_pred <- test_RF(model_train, feature_test_cv)
    label_pred <- ifelse(label_pred == 2, 0, 1)
    
    #prob_pred <- label_pred$predictions
    cv.error[i] <- 1 - (label_pred == label_test_cv) / length(label_test_cv)
    tpr.fpr <- roc(label_pred, label_test_cv)
    cv.AUC[i] <- tpr.fpr$auc
  }
  #return(c(mean(cv.error),sd(cv.error)))
  return(c(mean(cv.error),sd(cv.error), mean(cv.AUC), sd(cv.AUC)))
}