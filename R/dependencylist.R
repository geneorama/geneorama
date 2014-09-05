#' @name   dependencylist
#' @title  List all the dependent packages of the currently attached packages
#' @author Gene Leynes
#' 
#' @param standard_packages Packages considered by the user to be "standard".
#'                          The defaults is  c('stats', 'graphics', 'grDevices', 
#'                                             'utils', 'datasets', 'methods', 
#'                                             'base')
#' @param exclude_standard Exclude standard_packages in list? Default is TRUE
#'
#' @description
#' 		Get a list where each element is a currently attached pacakge.  The
#' 		elements of that list are all the dependent pacakges.
#'
#' @details
#' 		This function could change in the future.
#'
#' @seealso
#' 		\code{\link[base]{loadedNamespaces}}
#' 		\code{\link[utils]{installed.packages}}
#'
#' @examples
#' 		dependencylist()
#'



dependencylist <- function(standard_packages = c('stats', 'graphics',
												 'grDevices', 'utils',
												 'datasets', 'methods', 'base'),
						   exclude_standard = TRUE){
	pkglist <- as.data.frame(installed.packages(), stringsAsFactors=FALSE)
	pkglist <- pkglist[pkglist$Package%in%loadedNamespaces(),
					   c("Package", "Imports", "Depends")]
	ImportsOrDepends <- paste(pkglist$Imports, pkglist$Depends, sep=", ")
	importlist <- lapply(ImportsOrDepends, function(x)
		gsub(" ", "", strsplit(x, split=",")[[1]]))
	names(importlist) <- pkglist[,"Package"]
	importlist <- lapply(importlist, function(x) gsub("\\(.+\\)|\\n", "", x))
	importlist <- lapply(importlist, function(x) x[!x %in% c("R", standard_packages, "NA")])
	importlist[sapply(importlist, length)==0] <- NA
	if(exclude_standard){
		importlist <- importlist[!names(importlist) %in% standard_packages]
	}
	importlist
}

