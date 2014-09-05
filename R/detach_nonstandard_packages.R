
#' @title detach_nonstandard_packages - Detach any non-standard packages from
#' the search path
#'
#' @name detach_nonstandard_packages
#' @param standard_packages Vector of packages considered to be "standard" and
#' not detached.  The default value is c('stats', 'graphics', 'grDevices',
#' 'utils', 'datasets', 'methods', 'base', 'tools', 'Rcpp')
#' Although Rcpp isn't "standard", it can't be detached.
#' @param standard_namespaces Vector of standard namepaces NOT IMPLEMENTED
#' These are namespaces that you want to keep, if you are detaching namespaces;
#' i.e. (if detach_namespaces == TRUE)
#' The default value is c('tools', 'Rcpp', 'data.table')
#' @param detach_namespaces Do you want to detach name spaces? NOT IMPLEMENTED
#' Default value is FALSE
#'
#' @author Gene Leynes and Scott Rodgers
#'
#' @description
#' 		Detaches non standard packages for a (fairly) clean initialization at
#' 		the start of an interactive script.
#'
#' @details
#' 		This would be better if you could detach namespaces, but you really
#' 		can't.  Even though the logic pretty much exists, there issues with
#' 		unloading DLLs in Windows and similar complications in non-Windows
#' 		systems.
#'
#' 		The best way to detach namespaces is to restart R, which in R Studio
#' 		is quite easy; just select your current project again in the upper
#' 		right hand corner of the application and you'll be back where you were
#' 		with a clean R instance.
#'
#' @note
#' 		To see the full list of attached namespaces and pacakges run
#' 		\code{sessionInfo()}.  Load some pacakges first to see a decent example,
#' 		such as ggplot2, data.table, or caret.
#'
#' @seealso
#' 		\code{\link[utils]{sessionInfo}}
#' 		\code{\link[base]{loadedNamespaces}}
#'
#' @examples
#'		\dontrun{
#'
#'		##----------------------------------------------------------------------
#'		## Initialize a script by removing all packages and deleting all objects
#'		##----------------------------------------------------------------------
#'		library(geneorama)
#'		rm(list=ls())
#'		detach_nonstandard_packages()
#'		}
#'
#'
#'


detach_nonstandard_packages <- function(
	standard_packages = c('stats', 'graphics', 'grDevices', 'utils', 'datasets',
						  'methods', 'base', 'tools', 'Rcpp'),
	standard_namespaces = c('tools', 'Rcpp', 'data.table'),
	detach_namespaces = FALSE){
	
	## 2014-03-31   SJR   Extracted this function from 00_Initialize.R
	## 2014-05-05   GWL   Adding function to geneorama package
	## 2014-07-10   GWL   adding detach_nonstandard_namespaces (still experimental)
	
	
	## Define attached packages
	attached_packages = .packages()
	
	## Detach non standard packages
	cat('\nDetaching non-standard libraries:\n')
	for(pkg in attached_packages){
		if(! pkg %in% standard_packages){
			cat('Detaching:', pkg, '\n')
			detach(paste('package:', pkg, sep=''), character.only = TRUE)
		}
	}
	
	if(detach_namespaces){
		detach_nonstandard_namespaces(standard_packages = standard_packages,
									  standard_namespaces = standard_namespaces)
	}
}

if(FALSE){
	rm(list=ls())
	library(geneorama)
	detach_nonstandard_packages()
	library(geneorama)
	
}


