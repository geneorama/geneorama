bgfun <-
function(color='honeydew2',linecolor='grey45', addgridlines=TRUE, debug=FALSE){
	if(debug)browser()
	tmp=par("usr")
	rect(tmp[1], tmp[3], tmp[2], tmp[4], col=color)
	if(addgridlines){
		ylimits=par()$usr[c(3,4)]
		abline(h=pretty(ylimits,10), lty=2, col=linecolor)
	}
}
