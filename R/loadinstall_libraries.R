#' @name   loadinstall_libraries
#' @title  Load / Install CRAN Packages
#' @author Gene Leynes
#' 
#' @param required_packages   Character vector of pacakges to load / install
#'                            The default is "", in which case it doesn't try 
#'                            to install anything.
#' @param myrepos             Repository to use. Default is 
#'                            "http://cran.rstudio.com/"
#' @param install_only        Boolean to indicate if the packages are only 
#'                            to be installed, instead of installed an loaded.
#'
#' @description
#' 		Call this function to load a vector of required packages from
#' 		CRAN. It will try to load the packages, and intall them if they are
#' 		missing.
#'
#' @details
#' 		You may wish to update the default repo: "http://cran.rstudio.com/"
#'		##
#'		## 2014-03-31   SJR   Extracted this function from 00_Initialize.R
#'		## 2014-05-05   GWL   Adding function to geneorama package
#'		##
#'
#' @examples
#' 		## Warning: this will install these packages if you don't already have
#' 		## them
#' 		\dontrun{
#'		require(geneorama)
#'		loadinstall_libraries(c("ggplot2", "data.table"))
#' 		}

#'  require(geneorama)
#'	lll()
#'




loadinstall_libraries <- function(required_packages = c(),
								  myrepos = "http://cran.rstudio.com/",
								  install_only = FALSE){
	
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
	
	if(!install_only){
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
				cat('This package could not be loaded / installed:',
					pkg, '!\n')
				cat(rep('*', 80), '\n', sep='')
			}
		}
	}
}
