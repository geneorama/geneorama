#' @name   convert_datatable_DateIDate
#' @title  Find and convert data.table columns from POSIX to IDate
#' @author Gene Leynes
#' 
#' @param dat A data.table
#' @param cols (optional) A subset of columns to search (see details)
#' 
#' @description
#' 		Converts a data.table's columns from Dates to IDates.  This conversion
#' 		is done BY REFERENCE meaning that the original data.table is modified.
#' 		
#' @details
#' 		The data.table is returned invisibly if needed.
#' 		
#' 		The cols can be specified as a character vector of column names.  The
#' 		entire data.table is returned, but only the columns in "cols" are 
#' 		searched.  A warning is produced if no columns are POSIX.
#' 		
#' @seealso
#' 	\code{\link[data.table]{data.table}}
#' 	\code{\link[data.table]{as.IDate}} 
#' 	\code{\link[data.table]{set}} 
#'
#'
#'


convert_datatable_DateIDate <- function(dat, cols=NULL){
	# browser()}
	
	## If the user didn't sepcify particular columns, then use all columns
	if(is.null(cols)){
		cols <- colnames(dat)
	}
	## Find columns that match the class
	col_classes <- sapply(dat[ ,cols, with=FALSE], class)
	col_classes_match <- lapply(col_classes, grep, pattern="POSIX")
	cols <- which(sapply(col_classes_match, length) != 0)
	
	if(length(cols)==0){
		warning("No POSIX dates to convert")
		invisible(dat)
	} else {
		for(col in cols){
			set(dat, j=col, value=as.IDate(dat[[col]]))
		}
		invisible(dat)
	}
}

