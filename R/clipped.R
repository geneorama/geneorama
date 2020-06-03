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
#' New version based on:
#' https://stackoverflow.com/questions/10959521/how-to-write-to-clipboard-on-ubuntu-linux-in-r
#' 

clipped = function(header = TRUE,
				   sep = "\t",
				   na.strings = c("", "NA"),
				   check.names = FALSE,
				   stringsAsFactors = F,
				   dec = ".",
				   as.data.table = TRUE,
				   remove.spaces = TRUE,
				   ...) {
	#decide how to read
	#windows is easy!
	if (Sys.info()['sysname'] %in% c("Windows")) {
		#just read as normal
		ret <- read.table(file = con,
						  sep = sep, 
						  header = header,
						  check.names = check.names,
						  na.strings = na.strings,
						  stringsAsFactors = stringsAsFactors,
						  dec = dec, 
						  ...)
	} else {
		## Unix: try xclip approach 
		## https://stackoverflow.com/a/10960498/3980197
		
		## Define xclip function
		read.xclip = function(x) {
			#if xclip not installed
			if (!isTRUE(file.exists(Sys.which("xclip")[1L]))) {
				stop("Cannot find xclip")
			}
			con <- pipe("xclip -o -selection c", "r")
			on.exit(close(con))
			ret1 <- read.table(file = con,
							   sep = sep,
							   header = header,
							   check.names = check.names,
							   na.strings = na.strings,
							   stringsAsFactors = stringsAsFactors,
							   dec = dec,
							   ...)
			
			return(ret1)
		}
		
		## Try xclip function
		tryCatch({
			ret <- read.xclip(x)
		}, error = function(e) {
			message(sprintf("error: %s", e$message))
		})
	}
	
	## Convert return to data.table
	if(as.data.table){
		ret <- data.table::as.data.table(ret)				
	}
	
	## Remove spaces from column names
	if(remove.spaces){
		data.table::setnames(ret, gsub(" ", "_", colnames(ret)))
	}
	
	## Return result
	return(ret)
}


if(FALSE){
	source("R/clipped.R")
	examp <- clipped()
	examp
}
