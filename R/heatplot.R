heatplot <-
function(x,y,z,bgcol="#777044",coltype='heat', ccex = 1.5, circles=TRUE, ...){
	#browser()
	layout(matrix(c(1, 2, 3), nc=3), widths=c(7, 1, .5))
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
}
