#' @name   toc
#' @title  Stop timing
#' @author Gene Leynes
#'
#' @description
#' 		Matlab inspired timing method.  Put tic() at the start of a process, and
#' 		toc() at the end.
#'
#' @details
#'      Creates a global variable called ticTime.
#'      
#' 		System.time is preferred (see see also).
#' 		
#' @seealso
#' 	\code{\link{tic}}
#' 	\code{\link[base]{system.time}}
#' 	

toc <- function()
	print(proc.time()-ticTime)
