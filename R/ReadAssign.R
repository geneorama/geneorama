
##
## Read an Rds file and assign the value to the global environment with a
## the name implied from the filename
##

##
## 2014-04-01   SJR   Updated to take a path and filename
## 2014-05-05   GWL   Adding function to geneorama package
## 2014-05-05   GWL   Adding $ to gsub pattern argument
##

## Usage:
##     MyExampleData <- data.frame(x=letters, y=rnorm(length(letters)))
##     saveRDS(MyExampleData, file="MyExampleData.Rds")
##     rm(MyExampleData)
##     ReadAssign("MyExampleData.Rds")
##     ls()
##     unlink("MyExampleData.Rds"); rm(MyExampleData)  ## Clean up

ReadAssign <- function(x, assignGlobal = TRUE){
    dat <- readRDS(x)
    objname <- gsub("\\.Rds$", "", basename(x), ignore.case=TRUE)
    if(assignGlobal){
        assign(x=objname, value=dat, pos=.GlobalEnv)
        invisible(objname)
    } else {
        return(dat)
    }
}




