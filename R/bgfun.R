#' @name   bgfun
#' @title  Add a transparant background to a plot after it's plotted
#' @author Gene Leynes
#' 
#' @param color         Background color. Default is "honeydew2".
#' @param linecolor     Color used for gridlines.  Default is "grey45"
#' @param addgridlines  Add gridlines? Default is TRUE
#' 
#' @description
#' 		Adds a non-transparent background and gridlines to plots
#'
#' @details
#' 		Adds a slightly	more professional look to plots, and makes them easier to
#' 		read. The color can be customized, the default is the built in color
#' 		"honeydew2".
#' 		
#' 		This is something that's nice if you're too pressed for time to do it using
#' 		ggplot.
#' 		
#' 		Uses the info in \code{par("usr")} to draw a rectangle that is the same
#' 		size as your current plot area.  Normally \code{bgfun} is passed into
#' 		\code{panel.first} (see examples).
#'
#' @section Warning:
#' 		The \code{panel.first} argument in is not supported in
#' 		\code{plot.formula}!
#'
#' 	    See \code{plot.formula} workaround here:
#' 	    \url{http://r-project.markmail.org/thread/b4szqhorzynnzfhs} or in
#' 	    examples.
#'
#' @seealso
#' 	\code{\link{addbg}},
#' 	\code{\link{plot100colors}} to see color examples
#' 	\code{\link[ggplot2]{ggplot}} Way better
#'
#' @examples
#'
#'      require(geneorama)
#'
#'      ## Example of plot.default:
#'      plot(rnorm(100), panel.first=bgfun())
#'
#'      ## Example of plot.formula workaround:
#'      df = data.frame(x = 1:100,
#'                      y = rnorm(100))
#'      plot(y~x, data=df, type="n")
#'      points(y~x, data=df, panel.first=bgfun())
#'

bgfun <- function(color='honeydew2', linecolor='grey45', addgridlines=TRUE){
	tmp  <- par("usr")
	rect(tmp[1], tmp[3], tmp[2], tmp[4], col=color)
	if(addgridlines){
		ylimits=par()$usr[c(3,4)]
		abline(h=pretty(ylimits, 10), lty=2, col=linecolor)
	}
}


if(FALSE){
	rm(list=ls())
	source("R/bgfun.R")
	source('tests/test.bgfun.R')
	test.bgfun()
}







