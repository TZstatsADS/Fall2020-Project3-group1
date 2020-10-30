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
	Our train model on the entire training set (2400 observations) after cross-validation
res_cv_gbm.RData
	Results for cross-validation for gbm model 