# Project: Can you recognize the emotion from an image of a face?

### Output folder

The output directory contains analysis output, processed datasets, logs, or other processed things.


feature_test.RData
	Our training set for cross-validation (6006 features, 2400 observations)
feature_train.RData
	Our test set after cross-validation (6006 features, 60 observations)
fudicial_pt_list.RData
	The extracted fiducial feature data from the 3000 raw images 
fit_train_gbm.RData
	Our gbm train model on the entire training set (2400 observations) after cross-validation
res_cv_gbm.RData
	Results for cross-validation for gbm model 
fit_train_RF.RData
	Our random forest train model on the entire training set (2400 observations) after cross-validation
fit_train_rforestw.RData
	Our random forest with weights train model on the entire training set (2400 observations) after cross-validation
fit_train_svm.RData
	Our svm train model on the entire training set (2400 observations) after cross-validation
fit_train_xgboost.RData
	Our xgboost train model on the entire training set (2400 observations) after cross-validation
res_cv_gbm.RData
	Results for cross-validation for gbm model
res_cv_RF.RData
	Results for cross-validation for random forest model 
res_cv_rforestw.RData
	Results for cross-validation for random forest with weights model 	
res_cv_svm.RData
	Results for cross-validation for svm model 	
res_cv_xgboost.RData
	Results for cross-validation for xgboost model 
	
pcaCalc.rdata
	Results, i.e., principal components after conducting PCA on featured data
	
	
	