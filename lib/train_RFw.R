###########################################################
### Train a classification model with training features ###
###########################################################

train <- function(features, labels, w=NULL, ntree, md){
  labels <- ifelse(labels == 2, 0, 1)

  model <- ranger(formula = labels ~ .,
                  data = data.frame(cbind(features, labels)),
                  num.trees = ntree, #hyperparameter 1
                  # mtry = mtry, #hyperparameter 2
                  case.weights = w, # weights
                  importance = "none",
                  write.forest = TRUE,
                  # probability = FALSE,
                  min.node.size = 1,
                  max.depth = md, #hyperparameter 2
                  # replace = TRUE,
                  # sample.fraction = ifelse(replace, 1, 0.632),
                  # num.random.splits = 1,
                  # alpha = 0.5,
                  # minprop = 0.1,
                  regularization.factor = 1,
                  verbose = F,
                  # seed = 2020,
                  classification = T,
                  x = NULL,
                  y = NULL
      )
  
  
  return(model)
}



