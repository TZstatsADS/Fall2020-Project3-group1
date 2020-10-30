

extract_feature <- function(dir_path, y=NULL) {
  
  # Set image size
  width <- 50
  height <- 50
  
  img_size <- width * height
  
  ## List images in path
  images_names <- list.files(dir_path)
  
  ## This function will resize an image, turn it into greyscale
  feature_list <- pblapply(images_names, function(imgname) {
    ## Read image
    img <- readImage(file.path(dir_path, imgname))
    ## Resize image
    img_resized <- resize(img, w = width, h = height)
    ## Set to grayscale (normalized to max)
    grayimg <- channel(img_resized, "gray")
    ## Get the image as a matrix
    img_matrix <- grayimg@.Data
    ## Coerce to a vector (row-wise)
    img_vector <- as.vector(t(img_matrix))
    return(img_vector)
  })
  ## bind the list of vector into matrix
  feature_matrix <- do.call(rbind, feature_list)
  feature_matrix <- as.data.frame(feature_matrix)
  ## Set names
  names(feature_matrix) <- paste0("pixel", c(1:img_size))
  
  if(!is.null(y)){
    return(list(X = feature_matrix, y = y))
  }else{
    return(feature_matrix)
  }
}


nnfeatures=extract_feature(train_image_dir, info$label)



# par(mar = rep(0, 4))
# testCat <- t(matrix(as.numeric(nnfeatures$X[5,]),
#                     nrow = width, ncol = height, T))
# image(t(apply(testCat, 2, rev)), col = gray.colors(12),
#       axes = F)




# Sys.setenv(RETICULATE_PYTHON="C:/Users/apacz/AppData/Local/r-miniconda/envs/r-reticulate/Lib/")
# 
# trainfeatures=list(X=nnfeatures$X[train_idx,], y=nnfeatures$y[train_idx])
# testfeatures=list(X=nnfeatures$X[test_idx,], y=nnfeatures$y[test_idx])
# 
# # Fix structure for 2d CNN
# model=keras_model_sequential()
#   
# compile(model,
#         loss = 'binary_crossentropy',
#         optimizer = "adam",
#         metrics = c('accuracy')
# )
# 
# history=fit(model,
#             x = trainfeatures$X, y = as.numeric(trainfeatures$y),
#             verbose=2,
#             epochs = 30, batch_size = 100,
#             validation_split = 0.2)
# 
# plot(history)
# evaluate(model, testfeatures$X, as.numeric(testfeatures$y))




#train
trainx=data.frame(matrix(nrow=2400, ncol=2500))
count=1
while(count<=2500){
  trainx[,count]=trainfeatures$X[[count]]
  count=count+1
}
trainx=as.matrix(trainx)
trainx=trainx[,seq(from=1, to=2500, by=10)]
trainlab=trainfeatures$y
nn=nnet(trainlab~trainx, size=2)

#test data
testx=data.frame(matrix(nrow=600, ncol=2500))
count=1
while(count<=2500){
  testx[,count]=testfeatures$X[[count]]
  count=count+1
}
testx=as.matrix(testx)
testx=testx[,seq(from=1, to=2500, by=10)]
testlab=testfeatures$y

preds=predict(nn, newdata=testx)

#












########################

# Fix structure for 2d CNN
model=keras_model_sequential() %>%
layer_dropout(rate = 0.25) %>%
  layer_flatten() %>%
  layer_dense(units = 50, activation = "relu") %>%
  layer_dropout(rate = 0.25) %>%
  layer_dense(units = 1, activation = "sigmoid")
compile(model,
  loss = 'binary_crossentropy',
  optimizer = "adam",
  metrics = c('accuracy')
)
# model %>% compile(
#   optimizer = "adam",
#   loss = "sparse_categorical_crossentropy",
#   metrics = "accuracy"
# )
# summary(model)
history=fit(model,
  x = nnfeatures$X, y = as.numeric(nnfeatures$y),
  epochs = 30, batch_size = 100,
  validation_split = 0.2
)



history=fit(model,
            x = nnfeatures$X, y = as.numeric(nnfeatures$y))




model <- keras_model_sequential() %>%
  layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = "relu",
                input_shape = c(50,50,1)) %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = "relu") %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = "relu")%>%
  layer_flatten() %>%
  layer_dense(units = 64, activation = "relu") %>%
  layer_dense(units = 10, activation = "softmax")

model %>% compile(
  optimizer = "adam",
  loss = "sparse_categorical_crossentropy",
  metrics = "accuracy"
)
summary(model)

# history <- model %>%
#   fit(
#     x = nnfeatures$X, y = nnfeatures$y,
#     epochs = 10
#     # ,
#     # validation_split = 0.2,
#     # verbose=2
#   )

history=fit(model, nnfeatures$X, y = nnfeatures$y)
