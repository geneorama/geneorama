#' @name   plot100colors
#' @title  Generate a plot of colors to choose for plots
#' @author Gene Leynes
#' 
#' @param x    Starting point for colors shown in plot
#' @param ...  Additional parameters passed to plot
#'
#' @description
#' 		Plots a matrix of dots of built in colors.  The dots are labeled above
#' 		the dot with the number and the name of the color.  You can specify
#' 		either the name or number of the color when using in plot.
#'
#' @details
#' 		The first color is 1 (white), there are quite a few gradients of gray.
#'
#' @seealso
#'		\code{\link[ggplot2]{ggplot}} For the underlying color function
#'
#' @examples
#' 		require(geneorama)
#'
#' 		plot100colors(1)
#' 		plot100colors(101)
#' 		plot100colors(152) ## 100 shades of gray
#' 		plot100colors(252) ## Almost 100 shades of gray
#' 		plot100colors(352)
#' 		plot100colors(452)
#' 		plot100colors(552)
#' 		plot100colors(652) ## Mostly NA (no colors after 657)
#'
#'


plot100colors <- function(x){
	
	color <- index <- i <- NULL
	
	
	## make sure that x is at least 1
	x <- max(1, as.integer(x))
	dat <- data.frame(x = rep(1:10, times = 10),
					  y = rep(10:1, each = 10),
					  index = x:(x + 99),
					  color = colors()[x:(x + 99)],
					  stringsAsFactors = FALSE)
	plot(y ~ x, data = dat, cex = 5, col = color,
		 pch = 16, yaxt = 'n', xaxt = 'n', xlab = '', ylab = '')
	points(y ~ x, data = dat, cex=5, pch=21, lwd=1)
	text(y +.3 ~ x, data = dat, paste(index, "-", color), cex=.6)
	invisible(NULL)
}

if(FALSE){
	# rm(list=ls())
	# source("R/plot100colors.R")
	## No test... example test is enough
	# source('tests/test.plot100colors.R')
	# test.plot100colors()
	
	rm(list=ls())
	source("R/plot100colors.R")
	plot100colors(1)
	plot100colors(101)
	plot100colors(152) ## 100 shades of gray
	plot100colors(252) ## Almost 100 shades of gray
	plot100colors(352)
	plot100colors(452)
	plot100colors(552)
	plot100colors(652) ## mostly NA (no colors after 657)
}


