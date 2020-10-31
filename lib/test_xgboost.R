###########################################################
### Make predictions with test features ###
###########################################################
library(xgboost)

test <- function(model, features){
  res <- predict(model, newdata = features)
  return(res)
}

# This function is not necessary.
# We put it here just to show the structure.

