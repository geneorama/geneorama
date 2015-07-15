#' @name   convert_datatable_FactorString
#' @title  Convert data.table factor columns to string columns
#' @author Gene Leynes
#' 
#' @param dat	A data.table
#' @param cols	(optional) A vector of column names or column numbers to be 
#' 				converted. If blank, then all columns of class character are
#' 				converted.
#'
#' @description
#' 		Shortcut to convert data.table columns from factor to string.
#'
#' @details
#'      Returns the data.table invisibly because data.tables are modified in 
#'      place, and there is no need to make a copy.
#' 		
#' @seealso
#' 	\code{\link[data.table]{data.table}}
#' 	
#' @examples 
#' 		require(geneorama)
#' 		## Create examples
#' 		dt <- as.data.table(OrchardSprays)
#' 		dt[ , rowpos := as.factor(rowpos)]
#' 		dt[ , colpos := as.factor(colpos)]
#' 		str(dt)
#' 		dt2 <- copy(dt)
#' 		
#' 		## No columns specified
#' 		convert_datatable_FactorString(dt)
#' 		str(dt)
#' 		## Specify column by position
#' 		convert_datatable_FactorString(dt2, cols=2)
#' 		str(dt2)
#' 		convert_datatable_FactorString(dt2, cols="colpos")
#' 		str(dt2)
#' 	



convert_datatable_FactorString <- function(dat, cols=NULL){
	## Identify target columns, if not specified
	if(is.null(cols)){
		cols <- which(sapply(dat, class) == "factor")
	}
	## To avoid warning about numerical efficiency
	if(is.numeric(cols)){
		cols <- as.integer(cols)
	}
	## Convert columns
	for(col in cols){
		set(dat, j=col, value=as.character(dat[[col]]))
	}
	invisible(dat)
}

