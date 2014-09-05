#' @name   reset_graphic_parameters
#' @title  Reset the graphic parameters by opening a new plot window
#' @author Gene Leynes
#'
#' @description
#' 		Uses \code{dev.new} to open a new plot window, which resets the current
#' 		par.  This is still in development.
#' 		
#' @details
#' 		Also closes a plot window, so becareful.  At the commandline it writes
#' 		pdf files called Plot0.png... far from ideal.
#'##
#'## Reset graphic paramaters to default by creating a new plot window
#'##
#'## GWL - 2014-05-05 - Adding to geneorama
#'##
#'
#'## Usage: call reset_graphic_parameters() to start a new graphics window
#'## and reset back to the original par().  
#'
#'## Known issues: 
#'##    Calling this function will create Rplot[n].png files under certain
#'##    circumstances, probably when called from the command line.
#'##    
#'


reset_graphic_parameters <- function(){
  dev.new()
  op <- par(no.readonly = TRUE)
  dev.off()
  invisible(op)
}
