#' @name   convert_crlf
#' @title  convert crlf to lf in Windows
#' @author Gene Leynes
#' 
#' @param infile File to be converted
#' 
#' @description
#' 		Rewrite a file and substitute LF for CRLF.
#'
#' @details
#' 		LF is Unix.  Note that writeChar, writeLines, and other options don't 
#' 		work (as far as I can tell). Using cat on a wb file connection is the 
#' 		key.
#'
#' @seealso
#' 	\code{\link{cat}}, \code{\link{readLines}}, \code{\link{file}}
#'
#'
#' @examples
#' 		## NOT RUN:
#'		# files <- list.files(".", recursive = T, full.names = T)
#'		# sapply(files, convert_crlf)
#'


convert_crlf <- function(infile){
	print(infile)
	txt <- readLines(infile)
	f <- file(infile, open="wb")
	cat(txt, file=f, sep="\n")
	close(f)
}
