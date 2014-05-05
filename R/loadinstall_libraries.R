

##
## Load / Install CRAN Packages
##
## 2014-03-31   SJR   Extracted this function from 00_Initialize.R
## 2014-05-05   GWL   Adding function to geneorama package
##

## Usage: Call this function to load a vector of required packages that are
##        on CRAN. It will try to load the packages, and intall them if they
##        are missing.
##
##  Example:
##        require(geneorama)
##        required_packages <- c("ggplot2", "data.table")
##        loadinstall_libraries("required_packages")
##


loadinstall_libraries <- function(required_packages = c(),
                                  myrepos = "http://cran.rstudio.com/"){
    
    ## Set repository if my repos is not null
    if(!is.null(myrepos)){
        options(repos = c(CRAN = myrepos))
    }
    
    ## Packages installed on this computer
    installed_pacakges =  .packages(all.available = TRUE)
    
    ## Try and install any missing packages
    ## make a function
    for(pkg in required_packages){
        ## Check for missing packages
        if( ! pkg %in% installed_pacakges ){
            cat('\nAttempting to install package', pkg, '\n')
            cat(rep('*', 80), '\n', sep='')
            cat('Attempting to install', pkg, '\n')
            cat(rep('*', 80), '\n', sep='')
            install.packages(pkg)
            
            ## Update the list of installed packages
            ## Some packages that were missing may get installed as dependencies
            installed_pacakges =  .packages(all.available = TRUE)
        }
    }
    
    ## load packages
    ## make a function
    cat('\nLoading required libraries:\n')
    
    for(pkg in required_packages){
        ## Check that the package is not missing, display a warning if it is
        if( pkg %in% installed_pacakges ){
            cat('Attaching:', pkg, '\n')
            library(pkg, character.only=TRUE, quietly=TRUE)
        } else {
            cat(rep('*', 80), '\n', sep='')
            cat('This package could not be loaded because it is not installed:',
                pkg, '!\n')
            cat(rep('*', 80), '\n', sep='')
        }
    }
}
