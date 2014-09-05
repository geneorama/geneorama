
##------------------------------------------------------------------------------
## INITIALIZATION
##------------------------------------------------------------------------------
rm(list=ls())
gc()

source('R/dependencylist.R')
source('R/list2matrix.R')
source('R/detach_nonstandard_namespaces.R')
source('R/detach_nonstandard_packages.R')

library(geneorama)


loadinstall_libraries(c("geneorama", "data.table", "ggplot2", "caret", 
                        "reshape2", "corrplot", "rpart", "party", "e1071",
                        "AppliedPredictiveModeling", "partykit", "MASS"))

##------------------------------------------------------------------------------
## FUN DEV
##------------------------------------------------------------------------------
sessionInfo()

detach_nonstandard_packages(detach_namespaces=FALSE)
traceback()


detach_nonstandard_namespaces(
    standard_packages = c('stats', 'graphics', 'grDevices', 'utils', 'datasets', 
                          'methods', 'base', 'tools', 'Rcpp'),
    standard_namespaces = c('tools', 'Rcpp', 'data.table', 'reshape2',
                            'stringr', 'plyr'))


