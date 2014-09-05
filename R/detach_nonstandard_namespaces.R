
#' @title detach_nonstandard_namespaces (DOES NOT WORK)
#' @name detach_nonstandard_namespaces (DOES NOT WORK)
#' @param standard_packages Vector of packages considered to be "standard" and
#' not detached.  The default value is c('stats', 'graphics', 'grDevices',
#' 'utils', 'datasets', 'methods', 'base', 'tools', 'Rcpp')
#' Although Rcpp isn't "standard", it can't be detached.
#' @param standard_namespaces Vector of standard namepaces NOT IMPLEMENTED
#' These are namespaces that you want to keep, if you are detaching namespaces;
#' i.e. (if detach_namespaces == TRUE)
#' The default value is c('tools', 'Rcpp', 'data.table')
#' @param maxiter How many times deep do you want to try and detach name spaces?
#' This is to avoid an infinite recursion problem.
#' Default value is 20
#'
#' @author Gene Leynes and Scott Rodgers
#'
#' @description
#' 		Detaches non standard packages for a (fairly) clean initialization at
#' 		the start of an interactive script.
#'
#' @details
#' 		See the details in \code{\link{detach_nonstandard_packages}}
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
#' 		\code{\link{detach_nonstandard_packages}}
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
#'		## Really, I wouldn't run this:
#'		# detach_nonstandard_namespaces()
#'		}
#'
#'
#'


detach_nonstandard_namespaces <- function(
	standard_packages = c('stats', 'graphics', 'grDevices', 'utils', 'datasets',
						  'methods', 'base'),
	standard_namespaces = c('tools', 'Rcpp', 'data.table', 'reshape2',
							'stringr', 'plyr'),
	maxiter = 20){
	
	keepme <- unique(c(standard_packages, standard_namespaces))
	
	for(i in 1:maxiter){
		deplist <- dependencylist(standard_packages = keepme)
		if(length(deplist)==0){
			break
		} else if(all(sapply(deplist, length)==1) &&
				  	all(sapply(deplist, is.na))){
			for(pkg in names(deplist)) unloadNamespace(pkg)
			break
		} else {
			mat <- list2matrix(deplist)
			unloadme <- rownames(mat)[!rownames(mat) %in% colnames(mat)]
			for(pkg in unloadme) {
				unloadNamespace(pkg)
			}
		}
	}
	if(i == maxiter){
		warning('max iterations reached in detach_nonstandard_namespaces')
	}
}
