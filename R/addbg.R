addbg <-
function(color=heat.colors(40, alpha=.15)[30], 
		linecolor='grey75', addgridlines=TRUE, debug=FALSE){
	
	if(debug)browser()
	tmp=par("usr")
	rect(tmp[1], tmp[3], tmp[2], tmp[4], col=color)
	if(addgridlines){
		ylimits=par()$usr[c(3,4)]
		abline(h=pretty(ylimits,10), lty=2, col=linecolor)
	}
}
