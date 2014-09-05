
#' Black Scholes Calculator Test
#'
#'
#'

# rm(list=ls())
# source("R/bs.R")

test.bs_withdiv <- function(){

	require("RUnit")

	## Calculate the value of an option where the stock is 370, the
	## strike price is 485, the risk free rate is 4%, the vol (sigma) is .1,
	## and the time to maturity is 2
	result1 <- bs_withdiv(S=370, K=485, r=.04, vol=.1, mat=2, q=0)
	result2 <- bs_withdiv(S=370, K=485, r=.04, vol=.1, mat=2, q=.01)

	answer1 <- list(call = 2.359751,
					put = 80.07118,
					d1 = -1.277359,
					d2 = -1.418781)
	answer2 <- list(call = 1.707426,
					put = 86.74535,
					d1 = -1.418781,
					d2 = -1.560202)

	checkEquals(answer1$call, result1$call, "Wrong call value 1", .00001)
	checkEquals(answer1$put, result1$put, "Wrong put value 1", .00001)
	checkEquals(answer1$d1, result1$d1, "Wrong d1 value 1", .00001)
	checkEquals(answer1$d2, result1$d2, "Wrong d2 value 1", .00001)

	checkEquals(answer2$call, result2$call, "Wrong call value 2", .00001)
	checkEquals(answer2$put, result2$put, "Wrong put value 2", .00001)
	checkEquals(answer2$d1, result2$d1, "Wrong d1 value 2", .00001)
	checkEquals(answer2$d2, result2$d2, "Wrong d2 value 2", .00001)

	invisible(NULL)

}



