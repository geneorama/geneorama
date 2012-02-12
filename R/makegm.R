makegm <-
function(mu=0.05, sigma=0.20, dt=1, T=10, sims=1e4){
	###############################################################################
	## MakeGM - "Make Brownian Motion"
	## Function to generate geometric brownian motion
	## Returns matrix of accumulation factors (simulations x timesteps)
	## Author: gene.leynes
	## Date: 2010-07-07
	###############################################################################
	
	#browser()
	timesteps = T/dt
	phi = matrix(rnorm(timesteps*sims), nrow=sims, ncol=timesteps)
	x = (mu-sigma*sigma/2)*dt + sigma*phi*sqrt(dt)
	for (i in 1:nrow(x)) x[i,] = cumsum(x[i,])
	s = exp(x)
	#ds = exp(x)
	#s = matrix(NA,nrow(ds),ncol(ds))
	#for (i in 1:nrow(ds)) s[i,]<-cumprod(ds[i,])
	
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
		setwd('J:/frm_group/MStarFundResearch/R_Milliman')
		source('Functions/Function_makegm.R')
		## Replicating a European option
		x=makegm(mu=0.05, sigma=0.2, dt=1, T=10, sims = 1e6)
		mean(pmax(1.1 - x[,10], 0))*exp(-10*.05)# Put worth .0794
		mean(pmax(x[,10] - 1.1, 0))*exp(-10*.05)# Call worth .4122
	}
}
