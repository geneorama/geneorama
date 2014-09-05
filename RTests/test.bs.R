
## Black Scholes Calculator Test

test.bs <- function(){

	require("RUnit")

    ## Calculate the value of an option where the stock is 370, the
	## strike price is 485, the risk free rate is 4%, the vol (sigma) is .1,
	## and the time to maturity is 2
    result1 <- bs(S=370, K=485, r=.04, vol=.1, mat=2)

    answer1 <- list(call = 2.359751,
                    put = 80.07118,
                    d1 = -1.277359,
                    d2 = -1.418781)

    checkEquals(answer1$call, result1$call, "Wrong call value", .00001)
    checkEquals(answer1$put, result1$put, "Wrong put value", .00001)
    checkEquals(answer1$d1, result1$d1, "Wrong d1 value", .00001)
    checkEquals(answer1$d2, result1$d2, "Wrong d2 value", .00001)
}




