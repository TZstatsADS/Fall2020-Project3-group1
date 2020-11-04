# Project: Can you recognize the emotion from an image of a face?

### Doc folder

The doc directory contains the report or presentation files. 

main_edited.Rmd and main_edited.pdf 
	- These files report our methodology and our results. By referencing various R scripts in the lib folder, we extracted features from the images, created a training and test set, considered several models, cross-validated, and displayed model and runtime performances. 

Project3-Group1-presentation.pdf
	- presentation slide deck

test_day_output_edit.R 
	- This file uses the trained baseline (gbm) and proposed (xgboost) models to create predictions. This file does not run without the fit_train_gbm.RData, which is too big to be pushed onto Github. To run, the main_edit.Rmd file must be run first with the proper controls. This outputs the label_prediction.csv in the output folder.  

