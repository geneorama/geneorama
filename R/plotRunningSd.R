plotRunningSd <-
function(dat){
	require(gtools)	
	plot(dat)
	sdfun <- function(x,sign=1) mean(x) + sign * sd(x)
	lines(running(dat, width=51, pad=TRUE, fun=mean), col="blue")
	lines(running(dat, width=51, pad=TRUE, fun=sdfun, sign=-1), col="red")
	lines(running(dat, width=51, pad=TRUE, fun=sdfun, sign= 1), col="red")
}
