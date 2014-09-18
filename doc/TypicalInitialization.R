##------------------------------------------------------------------------------
## INITIALIZE
##------------------------------------------------------------------------------

## Remove all objects; perform garbage collection
rm(list=ls())
gc(reset=TRUE)

## Check for dependencies
if(!"geneorama" %in% rownames(installed.packages())){
    if(!"devtools" %in% rownames(installed.packages())){
        install.packages('devtools')
    }
    devtools::install_github('geneorama/geneorama')
}

## Load libraries
geneorama::detach_nonstandard_packages()
required_packages <- c("geneorama", "knitr", "caret", "gbm", "glmnet", "ROCR",
                       "pROC", "plyr", "class", "hmeasure", "randomForest",
                       "AppliedPredictiveModeling",
                       "data.table", "doParallel", "e1071", "rpart")
geneorama::loadinstall_libraries(required_packages)



