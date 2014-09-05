#' @name loader (DEPRICATED)
#' @title Loads a single object into memory
#' @author Gene Leynes
#'
#' @param x      filename
#' @param xPath  filepath
#'
#' @description
#' 		This was before I knew about readRDS.
#' 		
#' @details
#' 		Use readRDS instead
#' 		
#' @seealso
#' 	\code{\link{saver}},
#' 	\code{\link[base]{readRDS.}}
#'		
#'
#'
#'



loader <- function(x, xPath='.'){
	## Check if x already has ".RData" at the end
	if(length(grep('\\.[Rr][Dd]ata$', x))==0){
		x=paste(x,'.RData',sep='')
	}
	## Check if x already has ".RData" at the end
	xWithPath=file.path(xPath, x)
	rm(xPath)
	
	if(as.name(x)=='x') {
		load(xWithPath)
		rm(xWithPath)
		return(x)
	}else{
		load(xWithPath)
		rm(x,xWithPath)
		NewVar=ls()[1]
		return(eval(substitute(variable,
				list(variable = as.name(NewVar))	
		)))
	} 
	#	load(paste('Data/',x,'.RData',sep=''),env=,.GlobalEnv)
}
