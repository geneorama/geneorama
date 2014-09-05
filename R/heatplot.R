#' @name   heatplot
#' @title  Make colorful scatter plots where the color show relative values of a third dimension
#' @author Gene Leynes
#' 
#' @param x       vector for x position
#' @param y       vector for y position
#' @param z       vector for point size
#' @param bgcol   Background color.  Default is a brown color: "#777044"
#' @param coltype What family of colors to use.  Default is "heat"
#' @param ccex    Controls point size.  Default is 1.5
#' @param circles Do you want circles drawn around the plots?  (can be bad
#'                when there are a lot of points) Defaults to TRUE
#' @param ...     Additional parameters passed to plot()
#'
#' @description
#' 		Simple way to make scatter plot heatmaps
#'
#' @details
#' 		Plots x-y points with color to indicate size.
#'
#'
#' @examples
#'	N <- 1e4
#'	DT <- data.table(x <- 1:N,
#'					 y <- -exp(-x/3000-100) * 5e44 + 30 +
#'					 		 	rnorm(N, sd = 1 + (log(x/10)*.3)),
#'					 z <- sqrt(y) + rnorm(N, sd = 1 + (x*.03)))
#'	DT[ ,plot(x,y)]
#'	DT[ ,plot(x,z)]
#'	DT[ ,heatplot(x,y,z)]
#'	DT[ ,heatplot(x,y,z, circles=FALSE)]
#'
#'

heatplot <- function(x, y, z, bgcol="#777044", coltype='heat',
					 ccex = 1.5, circles=TRUE, ...){
	#browser()
	layout(matrix(c(1, 2, 3), ncol = 3), widths=c(7, 1, .5))
	## create the scatterplot withdifferent colors
	#ccols = heat.colors(length(z))
	ColFormula1 = paste(coltype, '.colors(length(z))', sep='')
	ccols = eval(parse(text=ColFormula1))
	bgfun=function(){
		tmp = par("usr")
		rect(tmp[1], tmp[3], tmp[2], tmp[4], col=bgcol)
		ylimits=par()$usr[c(3,4)]
		abline(h=pretty(ylimits,10), lty=2, col='black')
	}
	scale = function(x){(x-min(x))/diff(range(x))}
	xname = deparse(substitute(x))
	yname = deparse(substitute(y))
	zname = deparse(substitute(z))
	plot(x, y, pch=16, col=ccols[rank(z)], panel.first=bgfun(),
		 xlab=xname,ylab=yname, cex=ccex ,...)
	if(circles){
		points(x, y, cex=ccex)
	}
	
	zlim = range(z, finite=TRUE)
	lvs = pretty(zlim, 20)
	
	plot.new()
	mtext(paste('legend for "', zname, '" values', sep=''), side=2)
	plot.window(xlim=c(0, 1), ylim=range(lvs), xaxs="i", yaxs="i")
	points(1,1,cex=5)
	#rect(0, lvs[-length(lvs)],1, lvs[-1],
	#                col=heat.colors(length(lvs)-1))
	ColFormula2 = paste(coltype, '.colors(length(lvs)-1)', sep='')
	rect(.1, lvs[-length(lvs)],1, lvs[-1],
		 col=eval(parse(text=ColFormula2)))
	axis(4)
	layout(c(1))
	
	invisible(NULL)
}

if(FALSE){
	rm(list=ls())
	source("R/heatplot.R")
	# source('tests/test.heatplot.R')
	# test.heatplot()
	
	N <- 1e4
	DT <- data.table(x <- 1:N,
					 y <- -exp(-x/3000-100) * 5e44 + 30 +
					 	rnorm(N, sd = 1 + (log(x/10)*.3)),
					 z <- sqrt(y) + rnorm(N, sd = 1 + (x*.03)))
	DT[ ,plot(x,y)]
	DT[ ,plot(x,z)]
	DT[ ,heatplot(x,y,z)]
	DT[ ,heatplot(x,y,z, circles=FALSE, main="Something special")]
	
}

