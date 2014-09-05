#' @name   dftab
#' @title  Table as data.frame
#' @author Gene Leynes
#' 
#' @param x      Vector to tabluate
#' @param total  Calculate total? Default is TRUE
#' @param sort   Sort resulting data frame? Default is True
#'
#' @description
#' 		Just like using \code{table} with one argument, except that \code{dftab}
#' 		returns a sorted \code{data.frame} with a total.
#'
#' @details
#' 		This function is useful when you want to see a total of a table result,
#' 		to supporess lengthy table name printing, and when you need to access
#' 		the table result (sometimes tables can have challenges with the
#' 		structure).  Also the NA option is hardwired to be "ifAny".
#'
#' @seealso
#' 		\code{\link{table}}
#'
#' @examples
#'
#' 		require(geneorama)
#'
#' 		## Generate Data
#' 		set.seed(10)
#' 		df <- data.frame(column1 = sample(c(rep(NA, 5), rpois(25, 7))),
#' 						 column2 = sample(letters[1:5], replace=TRUE),
#' 						 column3 = sample(letters[1:5], replace=TRUE))
#' 		## Tablulate each column
#' 		dftab(df$column1)
#' 		dftab(df$column2)
#' 		dftab(df$column3)
#'
#' 		sapply(df, dftab)

dftab <- function(x, total=TRUE, sort=TRUE) {
	df <- table(x, useNA='ifany')
	if(sort) df <- df[order(df)]
	if(!sort) df <- df[unique(x)]
	names(df)[is.na(names(df))] <- 'NA'
	df <- data.frame(count=df)
	if (total) df <- rbind(df,TOTAL=sum(df))
	return(df)
}


if(FALSE){
	rm(list=ls())
	source("R/dftab.R")
	source('tests/test.dftab.R')
	test.dftab()
}







