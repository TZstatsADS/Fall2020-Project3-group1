###########################################################
### Train a classification model with training features ###
###########################################################

### Author: Yiran Lin
### Project 3
train <- function(features,labels,pca,np){
  # pca <- prcomp(features)
  loadings <- as.data.frame(pca$x)
  modSVM <- svm(label_train~.,data=loadings[1:np],
               type='C-classification',
               kernel='linear')
  model=modSVM
  return(model)
}