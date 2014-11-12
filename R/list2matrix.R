#' @name   list2matrix
#' @title  Convert a list to an indicator or count matrix
#' @author Gene Leynes
#' 
#' @param mylist   List to convert to matrix
#' @param count    Do want a full count of items, or just an indicator matrix?
#'                 Default value is FALSE; meaning just an indicator matrix.
#'
#' @description
#' 		Convert a list of vectors into an indicator matrix
#'
#' @details
#' 		Converts a list of vectors into an indicator matrix that spans the
#' 		universe of the list elements.  Add count = TRUE to show how many times
#' 		each item appears in each list element, otherwise it's a 1 or 0
#' 		indicator matrix.
#'
#' 		This is optimized for large matricies when count = FALSE.  The count
#' 		feature should slow things down a bit for large data sets.
#'
#'
#' @examples
#'
#' ## Imagine you had shoppers who had bought multiple items, sometimes in
#' ## multiples, and you wanted to pass the times into a model as a matrix.
#' ex <- list(ShopperNo1 = c("tomatoes", "apples", "oranges", "apples"),
#'            ShopperNo2 = c("watermellons", "apples", "mangos", "mangos", "mangos"),
#'            ShopperNo3 = c("carrots", "watermellons"),
#'            ShopperNo4 = c("mangos", "mangos", "mangos", "mangos"),
#'            ShopperNo5 = c("mangos"))
#' ex
#' ## Indicator matrix (fast on large data sets)
#' list2matrix(ex)
#' ## Count matrix shows how many times something occurred, not just if
#' ## it occurred
#' list2matrix(ex, count = TRUE)
#'
#'
#' ## This example is more confusing, but it can be interesting and useful to
#' ## see package dependencies, espeically if you have a lot of interdependent
#' ## packages loaded such as ggplot2, reshape2, data.table
#' deplist <- dependencylist(standard_packages = "")
#' list2matrix(deplist)
#' deplist
#'
#'


list2matrix <- function (mylist, count = FALSE) {
	Universe <- unique(unlist(mylist))
	Universe <- Universe[!is.na(Universe)]
	mat <- matrix(data = 0, 
				  nrow = length(mylist), 
				  ncol = length(Universe))
	for (j in 1:length(Universe)) {
		ii <- sapply(mylist, grepl, pattern=paste0("^",Universe[j],"$"))
		ii <- sapply(unname(ii), sum)
		if(!count){
			ii <- pmin(ii, 1)
		}
		mat[, j] <- ii
	}
	rownames(mat) <- names(mylist)
	colnames(mat) <- Universe
	return(mat)
}


## Old code:
## This is faster... so maybe it's worth fixing one day
## however it doesn't work when one element of universe is contained in another
## for example, in the example above with "watermellons" a list with "water" 
## would also match on "watermellons"

# list2matrix <- function(mylist, count=FALSE){
# 	Universe <- unique(unlist(mylist))
# 	Universe <- Universe[!is.na(Universe)]
# 	importlist_collapse <- vector(mode = "character",
# 								  length = length(mylist))
# 	for(i in 1:length(importlist_collapse)) {
# 		importlist_collapse[i] <- paste(mylist[[i]], collapse = ", ")
# 	}
# 	mat <- matrix(data = 0,
# 				  nrow = length(importlist_collapse),
# 				  ncol = length(Universe))
# 	for(j in 1:length(Universe)){
# 		ii <- grep(Universe[j], importlist_collapse)
# 		if(length(ii) > 0){
# 			if(count){
# 				for(i in ii){
# 					mat[i, j] <- length(grep(Universe[j], mylist[i][[1]]))
# 				}
# 			} else {
# 				mat[ii , j] <- 1
# 			}
# 			
# 			
# 		}
# 	}
# 	rownames(mat) <- names(mylist)
# 	colnames(mat) <- Universe
# 	return(mat)
# }



if(FALSE){
	rm(list=ls())
	source("R/list2matrix.R")
	source('tests/test.list2matrix.R')
	test.list2matrix()
	
	## Imagine you had shoppers who had bought multiple items, sometimes in
	## multiples, and you wanted to pass the times into a model as a matrix.
	ex <- list(ShopperNo1 = c("tomatoes", "apples", "oranges", "apples"),
			   ShopperNo2 = c("watermellons", "apples", "mangos", "mangos", "mangos"),
			   ShopperNo3 = c("carrots", "watermellons"),
			   ShopperNo4 = c("mangos", "mangos", "mangos", "mangos"),
			   ShopperNo5 = c("mangos"))
	ex
	## Indicator matrix (fast on large data sets)
	list2matrix(ex)
	## Count matrix shows how many times something occurred, not just if
	## it occurred
	list2matrix(ex, count = T)
	
	
	## This example is more confusing, but it can be interesting and useful to
	## see package dependencies, espeically if you have a lot of interdependent
	## packages loaded, for example ggplot2, reshape2, data.table
	deplist <- dependencylist(standard_packages = "")
	list2matrix(deplist)
	deplist
	
	# deparse(list2matrix(ex),backtick = F)
	# deparse(list2matrix(ex, T),backtick = F)
	# clipper(deparse(list2matrix(ex),backtick = F))
	# library(geneorama)
	
}







