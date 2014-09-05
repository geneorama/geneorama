#' @name lll
#' @title lll
#' @author Gene Leynes
#' 
#' @param sortBy    Which column to sort output by.  One of 'name', 'class', 
#'                  'size'. Default is "name"
#' @param digits    Number of digits to show in the object size field.
#'
#' @description
#' 		Nicer version of ls() with more info, and skips functions.
#'
#' @details
#' 		The lll function was inspired by the ll function in 'gtools', but
#' 		is modified for different needs.  Most notibly it doesn't list functions
#' 		so that the list is more compact, and it's easier to see what's
#' 		taking up space in your environment.
#'
#' @seealso
#' 		\code{\link{ll}} (in gdata)
#'
#' @examples
#'  require(geneorama)
#'	lll()
#'

lll <- function(sortBy=c('name', 'class', 'size')[1], digits = 0) {
	
	## DEFINE FUNCTION TO RETREIVE OBJECT CLASS
	objClass = function(object.name, pos) {
		object = get(object.name, pos = pos)
		class = class(object)[1]
		return(class)
	}
	
	## DEFINE FUNCTION TO RETREIVE OBJECT DIMENSION
	objDim = function(object.name, pos) {
		obj = get(object.name, pos = pos)
		objdim = paste(dim(obj),collapse=' x ')
		if(objdim == ''){
			objdim = length(obj)
		}
		return(objdim)
	}
	
	## DEFINE FUNCTION TO RETREIVE OBJECT SIZE
	objSize = function(objName, pos) {
		obj = get(objName, pos = pos)
		size = try(unclass(object.size(obj)), silent = TRUE)
		if (class(size) == "try-error") {
			size = 0
		}
		return(size)
	}
	
	## DEFINE ENVIRONMENT POSITION, ALWAYS USING POSTION 1
	pos = 1
	
	## GET OBJECTS
	items = ls(pos)
	
	## ATTACH ATTRIBUTES TO OBJECT
	if (length(items) == 0) {
		## If there are no objects, return empty data frame
		ret = data.frame()
	} else {
		## Otherwise, attach attributes using functions above
		ret = data.frame(
			Class = sapply(items, objClass, pos = pos),
			KB = round(sapply(items, objSize, pos = pos)/1024, digits),
			Dims = sapply(items, objDim, pos = pos))
		## If there are no objects, return empty data frame
		row.names(ret) = items
		## Remove any functions
		ret = ret[ret$Class != 'function', ]
	}
	
	## Clean up output if when only functions existed
	if(nrow(ret)==0){
		ret = data.frame()
	}
	
	## Sort by option:
	ret = switch(sortBy,
				 name = ret,
				 class = ret[order(ret$Class), ],
				 size = ret[rev(order(ret$KB)), ])
	
	return(ret)
}

if(FALSE){
	rm(list=ls())
	source("R/lll.R")
	# source('tests/test.lll.R')
	# test.lll()
	
	lll()
	
}


