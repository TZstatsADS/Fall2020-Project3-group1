###########################################################
### Make predictions with test features ###
###########################################################
library(xgboost)

test <- function(model, features){
  res <- predict(model, newdata = features)
  return(res)
}

