library(randomForest)
library(tidyverse)

data <- read.csv("Listings_updated.csv")

# levels(data$amenities)

data <- data[,!(names(data) %in% c("amenities", "X", "listing_id", "name", "neighbourhood", 
                                   "host_id", "host_location", "district", "latitude", "longitude"))]
data$city <- as.factor(data$city)
data <- data[complete.cases(data),]

cutdf <- data[1,]
set.seed(112358)
doublecutdf <- data[1,]


for(c in levels(as.factor(data$city))) {
  cutdf <- rbind(cutdf, data[sample(which(data$city == c), 1000), ])
}
cutdf <- cutdf[2:10001,]

for(c in levels(as.factor(data$city))) {
  doublecutdf <- rbind(doublecutdf, data[sample(which(data$city == c), 100), ])
}
doublecutdf <- doublecutdf[2:1001,]

randomForestFull = randomForest(formula = city ~., data = cutdf, importance = TRUE)

# DANGEROUS CODE!! DO NOT RUN
# max_mtry = 20
# mtry_models <- vector(mode = "list", length = max_mtry)
# # trying different mtry values
# for(i in 1:max_mtry) {
#   current_model <- randomForest(formula = city ~., data = train, importance = TRUE, mtry = i)
#   mtry_models[[i]] <- current_model
# }
# 
# max_maxnodes = 20
# maxnodes_models <- vector(mode = "list", length = max_maxnodes)
# # trying different maxnode values
# for(i in 1:max_maxnodes) {
#   current_model <- randomForest(formula = city ~., data = train, importance = TRUE, mtry = i)
#   maxnodes_models[[i]] <- current_model
# }
# END OF DANGEROUS CODE!

# greedy descent on mtry
mtry_i_init = 1
prev_init = 1
mtry_models <- vector(mode = "list")
mtry_descent <- function(prev, mtry_i, models) {
  current_model <- randomForest(formula = city ~., data = cutdf, mtry = mtry_i)
  current_oob = mean(current_model$confusion[,11])
  models[[mtry_i]] <- current_model
  if(prev >= current_oob) {
    mtry_descent(prev = current_oob, mtry_i = mtry_i + 1, models = models)
  } else {
    return(
    models
    )
  }
}
mtry_descent_models <- mtry_descent(prev_init, mtry_i_init, mtry_models)

#greedy descent on maxnodes !! DO NOT RUN!! TAKES > 12 HOURS!! IDK HOW LONG. IT NEVER FINISHED!!!!

# UPDATE: i changed this function to iterate over nodesize instead. it works now.
maxnodes_i_init = 1
maxnodes_models <- vector(mode = "list")
maxnodes_descent <- function(prev, maxnodes_i, models) {
  current_model <- randomForest(formula = city ~., data = doublecutdf, nodesize = maxnodes_i)
  current_oob = mean(current_model$confusion[,11])
  models[[maxnodes_i]] <- current_model
  if(maxnodes_i <= 10) {
    new_maxnodes = maxnodes_i + 1
    maxnodes_descent(prev = current_oob, maxnodes_i = new_maxnodes, models = models)
  } else {
    return(
      models
    )
  }
}
maxnodes_descent_models <- maxnodes_descent(prev = prev_init, 
                                            maxnodes_i = maxnodes_i_init, models = maxnodes_models)

# backward selecting predictors


# this function is FUCKED LOL just use rfcv()
backwardselect <- function(model, formula, oob) {
  worst = as.factor(names(which.min(model$importance[,12])))
#  current_oob = mean(model$confusion[,11])
  current_oob = oob
#  f = paste("city", "~", ".", "-", worst)
  p = paste("city", formula, sep = " ~ ")
  f = paste(p, "-", worst)
  ff <- as.formula(f)
  
  new_model <- randomForest(ff, data = doublecutdf, importance = TRUE)
  newoob = mean(new_model$confusion[,11])
  if(newoob < current_oob) {
    rec = backwardselect(new_model, as.character(ff[3]), newoob)
    ret = list(rec, new_model)
    return(ret)
  } else {
    return(new_model)
  }
}
backwardselect(randomForestFull, formula = "." , oob = 1)



testcv <- rfcv(doublecutdf[,-9], doublecutdf$city, cv.folds = 5)
testcv2 <- rfcv(cutdf[,-9], cutdf$city, cv.folds = 5)

#
saveRDS(testcv2, file = "testcv2.rds")
saveRDS(testcv, file = "testcv.rds")
saveRDS(mtry_descent_models, file = "mtry_descent_models")



bestvars <- names(cutdf[,-7][,order(randomForestFull$importance[,12])])[42:83]
pluses = paste(bestvars, collapse = " + ")
form = as.formula(paste("city", "~", pluses))

reducedrf <- randomForest(formula = form, data = data, importance = TRUE, mtry = 7)
fullrf <- randomForest(formula = city~., data = data, importance = TRUE, mtry = 7)
# fullrf_big <- randomForest(formula = city~., data = data, mtry = 7)

saveRDS(fullrf, file = "fullrf.rds")
saveRDS(reducedrf, file = "reducedrf.rds")
