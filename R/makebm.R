#' @name   makebm
#' @title  Make a matrix simulating Brownian motion 
#' @author Gene Leynes
#'
#' @param mu       Drift.  Default is 0.05, 
#' @param sigma    Variance. Default is .20, 
#' @param dt       Timestep.  Default is 1, 
#' @param T        Total Timesteps / columns.  Default is 10, 
#' @param sims     Simulations / rows. Default is 1e4
#'
#' @description
#' 		Creates a matrix simulating Brownian motion
#' 
#' @details
#' 		The makegm function is preferred for things like pricing options.
#' 		
#' 		
#' @seealso
#' 	\code{\link{makegm}},
#'		
#'
#'
#'


makebm <- function(mu=0.05, sigma=0.20, dt=1, T=10, sims=1e4){
	###############################################################################
	## MakeBM - "Make Brownian Motion"
	## Function to generate simple brownian motion
	## Returns matrix of accumulation factors (simulations x timesteps)
	## Author: gene.leynes
	## Date: 2010-07-07
	###############################################################################

	#browser()
	timesteps = T/dt
	phi = matrix(rnorm(timesteps*sims), nrow=sims, ncol=timesteps)
	ds = mu*dt + sigma*sqrt(dt)*phi
	#s = t(apply(1+ds, 1, cumprod))
	s = matrix(NA,nrow(ds),ncol(ds))
	for (i in 1:nrow(ds)) s[i,]<-cumprod(1+ds[i,])
	attr(s,'mu')=mu
	attr(s,'sigma')=sigma
	attr(s,'dt')=dt
	attr(s,'T')=T
	attr(s,'sims')=sims
	#attr(s,'ds')=ds
	return(s)
	
	##-----------------------------------------------------------------------------
	## Syntax example:
	##-----------------------------------------------------------------------------
	if(FALSE){
		makebm(mu=0.05, sigma=0.20, dt=1, T=10, sims=15)
		makebm(mu=0.05, sigma=0.002, dt=1, T=100, sims=15)

		x=makebm(mu=0.05, sigma=0.020, dt=1, T=10, sims=1e5)
		mean(x[,10]^(1/10)) # 1.05
		mean(x[,10])^(1/10) # 1.05
		sd(x[,10]/x[,9])    # 0.02
		mean(x[,10]/x[,9])  # 1.05
		x=makebm(mu=0.05, sigma=0.20, dt=1, T=10, sims=1e6)
		mean(pmax(1.1 - x[,10], 0))*exp(-10*.05)# Put worth .0794
		mean(pmax(x[,10] - 1.1, 0))*exp(-10*.05)# Call worth .4122
		}
}
