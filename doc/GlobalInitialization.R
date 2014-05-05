##------------------------------------------------------------------------------
## INITIALIZE PROJECT OR SUB PROJECT
##------------------------------------------------------------------------------

## Remove all objects; perform garbage collection
rm(list=ls())
gc(reset=TRUE)

##------------------------------------------------------------------------------
## LOAD FUNCTIONS
##------------------------------------------------------------------------------

## Load geneorama (for sourceDir)
source("../functions_init/loadinstall_geneorama.R")
loadinstall_geneorama()

## Load project functions
sourceDir("../functions")

##------------------------------------------------------------------------------
## REQUIRED LIBRARIES
##------------------------------------------------------------------------------

required_packages <- c("geneorama", "knitr", "caret", "gbm", "glmnet", "ROCR",
                       "pROC", "plyr", "class", "hmeasure", "randomForest",
                       # "AppliedPredictiveModeling",
                       "data.table", "doParallel", "e1071", "rpart")

##------------------------------------------------------------------------------
## SAVE ENVIRONMENT TO RDATA FILE
##------------------------------------------------------------------------------
save.image("environment.RData")



