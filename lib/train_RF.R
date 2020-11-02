###########################################################
### Train a classification model with training features ###
###########################################################


train_RF <- function(features, labels, ntree, mtry){
  labels <- as.character(labels)
  labels <- as.factor(labels)
  model <- randomForest(features, labels, ntree=ntree, mtry=mtry )
  return(model)
}



