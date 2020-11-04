

# test day 

# note, this rscript does not run without the large .RData file that is NOT in the project folder. 
# must run main_edited.Rmd for the proper control

# set working directories - change as needed 
# setwd("~/GitHub/Fall2020-Project3-group1/doc")
# setwd("~/")

# libraries 

library(R.matlab)
library(readxl)
library(dplyr)
library(EBImage)
# library(ggplot2)
library(caret)
# library(glmnet)
# library(WeightedROC)

library(gbm)
library(xgboost)

# set directory for downloaded test data

# test_dir <- "../data/test_set/"
test_dir <- "~/test_set_1-1196/"  ############################ NEED TO CHANGE TO PROPER FILE NAME ON TEST DAY

test_image_dir <- paste(test_dir, "images/", sep="")
test_pt_dir <- paste(test_dir,  "points/", sep="")
# test_label_path <- paste(test_dir, "label_predicted.csv", sep="") # no labels 


# read in data to get fiducial points list 
# n_files must be the image numbers themselves

n_files <- length(list.files(test_image_dir))
# n_files <- c(1:200, 2801:3000) ############################ run this line if files are not numbered from 0001 to XXXX

readMat.matrix <- function(index){
  return(round(readMat(paste0(test_pt_dir, sprintf("%04d", index), ".mat"))[[1]],0))
}


fiducial_pt_list <- lapply(1:n_files, readMat.matrix)
# fiducial_pt_list <- lapply(n_files, readMat.matrix) ############################ run this line if files are not numbered from 0001 to XXXX


# create the data matrix of features
# use -1 as a dummy label in order for features.R to run 

Index <- c(1:n_files)
info = data.frame(Index)
info$label = rep(-1, n_files) 
test_idx <- c(1:n_files)


# Index <- c(n_files) ############################ run this line if files are not numbered from 0001 to XXXX
# info = data.frame(Index) ############################ run this line if files are not numbered from 0001 to XXXX
# info$label = rep(-1, length(n_files)) ############################ run this line if files are not numbered from 0001 to XXXX
# test_idx <- c(1:length(n_files)) ############################ run this line if files are not numbered from 0001 to XXXX

source("../lib/feature.R") ############################ NEED TO CHANGE TO PROPER FILE NAME ON TEST DAY
dat_test <- feature(fiducial_pt_list, test_idx)

# create actual dataset of features

feature_test <- as.matrix(dat_test[, -6007])
# label_test <- as.integer(dat_test$label) # no labels 

# load the trained gmb (baseline) and xgboost (proposed) models 

# gbm
load(file="../output/fit_train_gbm.RData") ############################ NEED TO CHANGE TO PROPER FILE NAME ON TEST DAY
source("../lib/test_gbm.R")

# apply the trained gbm model on the testing set
prob_pred_gbm <- test(fit_train_gbm, feature_test, pred.type = 'response')
label_pred_gbm <- ifelse(prob_pred_gbm >= 0.5, 0, 1) # switched the 0s and 1s from the predictions to get correct class

label_pred_gbm

# xgboost 

load(file="../output/fit_train_xgboost.RData") ############################ NEED TO CHANGE TO PROPER FILE NAME ON TEST DAY
source("../lib/test_xgboost.R")

# apply the trained xgboost model on the testing set
prob_pred_xgboost <- test(fit_train_xgboost, feature_test) # new data needs to be a matrix
label_pred_xgboost <- ifelse(prob_pred_xgboost >= 0.5, 0, 1) # switched the 0s and 1s from the predictions to get correct class

label_pred_xgboost


# truth from training data set 
# 1 is the minority class
# 0 is the majority class

# both models know that 1 is the minority class now 

# combining results
Index <- c(1:n_files)
# Index <- c(n_files) ############################ run this line if files are not numbered from 0001 to XXXX

Baseline <- label_pred_gbm
Advanced <- label_pred_xgboost

label_predicted <- cbind(Index, Baseline, Advanced)

# write.csv(label_prediction,'../output/label_prediction.csv', row.names = FALSE) ############################ uncomment when creating and saving a .csv file
