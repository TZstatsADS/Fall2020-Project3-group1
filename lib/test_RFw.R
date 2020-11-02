###########################################################
### Make predictions with test features ###
###########################################################

test <- function(model, features){
  res <- predict(model, data.frame(features), type = "response", predict.all = F)
  return(res)
}

