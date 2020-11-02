###########################################################
### Make predictions with test features ###
###########################################################

test_RF <- function(model, features){
  res <- predict(model, newx = features)
  return(res)
}

# This function is not necessary.
# We put it here just to show the structure.