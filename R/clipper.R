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
#' New version based on:
#' https://stackoverflow.com/questions/10959521/how-to-write-to-clipboard-on-ubuntu-linux-in-r
#' 


clipper = function(x, 
				   quote = TRUE, 
				   sep = "\t", 
				   eol = "\n", 
				   na = "", 
				   dec = ".", 
				   row.names = FALSE, 
				   col.names = TRUE, 
				   qmethod = c("escape", "double")) {
	#decide how to write
	#windows is easy!
	if (Sys.info()['sysname'] %in% c("Windows")) {
		#just write as normal
		write.table(x = x,
					file = "clipboard", 
					sep = sep, 
					eol = eol,
					na = na,
					dec = dec,
					row.names = row.names,
					col.names = col.names,
					qmethod = qmethod)
	} else {
		#for non-windows, try xclip approach
		#https://stackoverflow.com/a/10960498/3980197
		write.xclip = function(x) {
			#if xclip not installed
			if (!isTRUE(file.exists(Sys.which("xclip")[1L]))) {
				stop("Cannot find xclip")
			}
			con <- pipe("xclip -selection c", "w")
			on.exit(close(con))
			write.table(x, 
						con, 
						sep = sep, 
						eol = eol,
						na = na,
						dec = dec,
						row.names = row.names,
						col.names = col.names,
						qmethod = qmethod)
		}
		
		tryCatch({
			write.xclip(x)
		}, error = function(e) {
			message("Could not write using xclip")
		})
	}
}

if(FALSE){
	clipper(data.frame(x=1:4, y=letters[1:4]))
}






