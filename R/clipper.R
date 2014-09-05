#' @name   clipper
#' @title  Put items from R onto your cliboard (Windows)
#' @author Gene Leynes
#' 
#' @param x Object to be written to clipboard.
#' 
#' @description
#' 		Useful shortcut to put small objects on your clipboard.  Works well
#' 		with Excel.
#'
#' @details
#' 		Only works in Windows. Only works for simple objects, like 0, 1, and 2
#' 		dimensional objects.
#'
#'
#' @seealso
#' 	\code{\link{clipboard}},
#'
#' @examples
#'		\dontrun{
#'
#'      require(geneorama)
#'
#'		## Copy a 10 by 10 matrix to your clipboard, and paste into a
#'		## spreadsheet or other file.
#'		clipper(matrix(rnorm(100),10,10))
#'		}
#'


clipper <- function(x){
	write.table(x,"clipboard", sep="\t", col.names=TRUE, row.names=FALSE)
}








