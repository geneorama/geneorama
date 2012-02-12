boxplot2 <-
function(x, y, fgcol='plum3', bgcol="lightyellow", addgridlines=TRUE, ...){
	#browser()
	dat=data.frame(x=as.factor(x),y)
	
	## PLOT TO FIND OUT DIMENSIONS
	plot(dat, axes=FALSE, xlab=NULL, ylab=NULL)
	
	## ADD THE BACKGROUND
	tmp=par()$usr
	rect(tmp[1], tmp[3], tmp[2], tmp[4], col = bgcol)
	
	if(addgridlines){
		ylimits=par()$usr[c(3,4)]
		yrange=diff(ylimits)
		if(yrange>2){
			yscale=log(yrange,10)+.150
		}else{
			yscale=log(yrange,10)-.150
		}
		yexp=round(yscale)-1
		ystep=10^yexp
		if(yrange>2){
			ybot=trunc(ylimits[1]/ystep)*ystep-ystep
			ytop=(1+trunc(ylimits[2]/ystep))*ystep
		}else{
			ybot=trunc(ylimits[1])-1
			ytop=trunc(ylimits[2])+1
		}
		if(abs(ystep)>getOption('ts.eps')){
			ysegs=seq(ybot, ytop, ystep)
			abline(h=ysegs, lty=2, col='grey75')
		}
	}
	plot(dat, add=TRUE, col=fgcol, ...)
}
