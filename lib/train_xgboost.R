###########################################################
### Train a classification model with training features ###
###########################################################

train <- function(features, labels, w = NULL, eta_val, lmd, gam, nr){
  labels <- ifelse(labels == 2, 0, 1)
  
  param <- list(objective = "binary:logistic", eval_metric = "auc")
  
  model <- xgboost(data = feature_train, 
                           label = labels, 
                           weight =  w, 
                           params = param, 
                           eta = eta_val, # hyperparameter 1  
                           lambda = lmd, # hyperparameter 2
                           gamma = gam, # hyperparameter 3
                           nrounds = nr, # hyperparameter 3
                           verbose = 0, 
                           max_depth = 1) 
  
  return(model)
}


