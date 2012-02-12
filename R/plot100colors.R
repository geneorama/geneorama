plot100colors <-
function(x){
	dat=data.frame(
		x=rep(1:10,each=10),
		y=rep(1:10, 10))
	dat$y = 11 - dat$y
	z=matrix(x:(x+99),10,10,byrow=TRUE)
	plot(dat, cex=5, col=colors()[z], pch=16, yaxt='n', xaxt='n', xlab='', ylab='')
	points(dat, cex=5, pch=21, lwd=1)
	text(dat$x, dat$y-.3, colors()[z], cex=.6)
	text(dat$x, dat$y-.4, z, cex=.6)
}
