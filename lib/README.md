# Project: Can you recognize the emotion from an image of a face?

### lib folder

The lib directory serve as the library, containing the seperate train, test and cross validation files we used for each model. 

cross_validation_gbm.R
  Our cross validation function file for the gbm model
cross_validation_RF.R
  Our cross validation function file for the random forest model
cross_validation_RFw.R
  Our cross validation function file for the random forest with weights model
cross_validation_svm.R
  Our cross validation function file for the svm model
cross_validation_xgboost.R
  Our cross validation function file for the xgboost model
  

feature.R
  The wrapper for all our feature engineering functions and options. The function `feature( )`  have options that correspond to different scenarios for our project and produces an R object that contains features and responses that are required by all the models we are going to evaluate later. 
test_gbm.R
  Our test function file for the gbm model
test_RF.R
  Our test function file for the random forest model
test_RFw.R
  Our test function file for the random forest with weights model
test_svm.R
  Our test function file for the svm model
test_xgboost.R
  Our test function file for the xgboost model
  
  
train_gbm.R
  Our train function file for the gbm model
train_RF.R
  Our train function file for the random forest model
train_RFw.R
  Our train function file for the random forest with weights model
train_svm.R
  Our train function file for the svm model
train_xgboost.R
  Our train function file for the xgboost model
