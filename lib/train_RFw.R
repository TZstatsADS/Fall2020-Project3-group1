###########################################################
### Train a classification model with training features ###
###########################################################

train <- function(features, labels, w=NULL, ntree, md){
  labels <- ifelse(labels == 2, 0, 1)

  model <- ranger(formula = labels ~ .,
                  data = data.frame(cbind(features, labels)),
                  num.trees = ntree, #hyperparameter 1
                  case.weights = w, # weights
                  importance = "none",
                  write.forest = TRUE,
                  # probability = FALSE,
                  min.node.size = 1,
                  max.depth = md, #hyperparameter 2
                  regularization.factor = 1,
                  verbose = F,
                  classification = T,
                  x = NULL,
                  y = NULL
      )
  
  
  return(model)
}



