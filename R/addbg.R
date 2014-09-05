#' @name   addbg
#' @title  Add an opaque background to a plot when plotting
#' @author Gene Leynes
#' 
#' @param color        Background color. The default is a yellow from '
#'                     \code{heat.colors} that happens to look reasonable when 
#'                     alpha is applied.
#' @param linecolor    Color used for gridlines.  Default is "grey75"
#' @param addgridlines Add gridlines? Default is TRUE
#'
#' @description
#' 		Adds a transparent foreground and gridlines to plots to create the
#' 		illusion of a background.
#'
#' @details
#'   	The background and gridlines can be  slightly
#' 		more professional looking and easier to read. The color can be customized,
#' 		the default is \code{heat.colors(40, alpha=.15)[30]}.
#'
#' 		This is something that's nice if you're too pressed for time to do it
#' 		using ggplot.
#' 		
#' 		Uses the info in \code{par("usr")} to draw a rectangle that is the same
#' 		size as your current plot area.  Sometimes the transparency doesn't show
#' 		up well when copied into other applications, so use at your own risk.
#'
#' @seealso
#' 	\code{\link{bgfun}},
#' 	\code{\link{plot100colors}} to see color examples
#' 	\code{\link[ggplot2]{ggplot}} Way better
#'
#' @examples
#'
#'      require(geneorama)
#'
#'      plot(1:10)
#'      addbg()
#'


addbg <- function(color = heat.colors(40, alpha=.15)[30],
				  linecolor = 'grey75',
				  addgridlines = TRUE){
	
	## ADD BACKGROUND
	tmp <- par("usr")
	rect(tmp[1], tmp[3], tmp[2], tmp[4], col=color)
	
	## ADD GRIDLINES
	if(addgridlines){
		## Get plot limits from user
		ylimits <- par()$usr[c(3,4)]
		
		## add gridlines at "pretty" intervals
		abline(h = pretty(ylimits,10),
			   lty = 2,
			   col = linecolor)
	}
}



if(FALSE){
	rm(list=ls())
	source("R/addbg.R")
	source('tests/test.addbg.R')
	test.addbg()
}







