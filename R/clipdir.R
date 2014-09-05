#' @name   clipdir
#' @title  Copy setwd and the current directory to your clipboard (Windows)
#' @author Gene Leynes
#' 
#' @description
#' 		Copies the working directory onto your clipboard, and puts it into a
#' 		"setwd" command. 
#' 		
#' @details
#' 		This is useful if you want to open another instance of R
#' 		and instantly navigate to the current working directory.
#' 		
#' 		Before R Studio's elegant directory management, this was useful when
#' 		opening new instances of R.  It allows the user to quickly copy the same
#' 		the same working directory as an existing instance into the new one.  
#' 		Also, it was useful for saving the current wd in a script after manually
#' 		navigating there.  With R Studio just use that for your project 
#' 		management!
#' 		
#' 		It's still useful when testing something in a new instance.	For example, if
#' 		you were working in "C:/Projects/MasterProject/Examp" and you wanted to
#' 		test something in a new instance of R, you could run clipdir(), open a new
#' 		instance of R, and paste this command from your	clipboard:
#' 		setwd("C:/Projects/MasterProject/Examp")
#' 		In the new instance you would be in the old directory with all your 
#' 		local folders.  So you can run things in parallel and test/debug/develop.
#' 		
#' @note 
#' 		Only works in Windows because of clipboard.
#'
#' @seealso
#' 	\code{\link{clipboard}},
#'
#' @examples
#'		\dontrun{
#'
#'      require(geneorama)
#'
#'		## Copy the current working directory to your clipboard
#'		clippdir()
#'
#'		## Now open a new instance of R and paste in the result.
#'		}
#'

clipdir <- function(){
	temp <- getwd()[1]
	temp <- paste('setwd(\'',temp,'\')',sep='')
	write.table(temp, "clipboard", sep = "\t",
				col.names=FALSE, row.names=FALSE, quote=FALSE)
}








