#' @name   clipped
#' @title  Dump clipboard contents into R; especially from Excel (Windows)
#' @author Gene Leynes
#' 
#' @param lowercase Converts column names to lower case
#' @param removedot Removes .'s from column names
#'
#' @description
#' 		Useful shortcut for reading objects from your clipboard.
#'
#' @details
#' 		Only works in Windows. Puts everything in a data.frame, uses
#' 		\code{stringsAsFactors=FALSE}
#'
#' @seealso
#' 	\code{\link{clipboard}},
#'
#' @examples
#'		\dontrun{
#'
#'      require(geneorama)
#'
#'		## Copy a range of cells in Excel (or whatever) then assign the data
#'		## to "clipped_example"
#'		clipped_example <- clipped()
#'
#'		## View the result in R
#'		print(clipped_example)
#'		str(clipped_example)
#'		}
#'


clipped <- function(lowercase=TRUE, removedot=TRUE){
	x <- read.delim("clipboard", stringsAsFactors=FALSE)
	if (lowercase) colnames(x) <- tolower(colnames(x))
	if (removedot) colnames(x) <- gsub('\\.','',colnames(x))
	return(x)
}








