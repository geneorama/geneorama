##
## Detach any non-standard packages from memory
##
## 2014-03-31   SJR   Extracted this function from 00_Initialize.R
## 2014-05-05   GWL   Adding function to geneorama package
##

## Usage: Detach libraries that are not default libraries in R. This is used
##        to ensure a clean environment.
##


detach_nonstandard_packages <- function(
    standard_packages = c('stats', 'graphics', 'grDevices', 'utils', 'datasets',
                          'methods', 'base')){
    
    ## Define attached packages
    attached_packages = .packages()
    
    ## Detach non standard packages
    cat('\nDetaching non-standard libraries:\n')
    for(pkg in attached_packages){
        if(! pkg %in% standard_packages){
            cat('Detaching:', pkg, '\n')
            detach(paste('package:', pkg, sep=''), character.only=TRUE)
        }
    }
}
