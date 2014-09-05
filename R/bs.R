#' @name   bs
#' @title  Black Scholes Calculator
#' @author Gene Leynes
#' 
#' @param S   Current stock price
#' @param K   Strike price
#' @param r   Risk free rate of return
#' @param vol Volatility of the stock expressed as \eqn{\sigma}{\sigma}
#' @param mat Time to maturity
#'
#' @description
#' 		Uses black Scholes formula to calculate the value of an option.
#'
#' @details
#' 		You need to convert \code{r} and \code{vol} to match the time period
#' 		\code{mat}.
#'
#' @note
#' 		Assumes that the option is european, there is a constant risk-free
#'      interest rate, the stock price follows geometric Brownian motion with
#'      constant drift and volatility, and the stock does not pay a dividend.
#'      Also assumes that there are no transaction costs and the market is
#'      frictionless.
#'      
#' @source
#' 		\url{http://en.wikipedia.org/wiki/Black-Scholes_model}
#' 		
#' 		Options, Futures and Other Derivatives (6th Edition) by John C. Hull
#'
#' @seealso
#' 	\code{\link{bs_withdiv}},
#'
#'


bs <- function(S, K, r, vol, mat){
	
	d1 <- 1 / (vol * sqrt(mat))  * (log(S / K) + (r + vol^2/2) * (mat))
	d2 <- 1 / (vol * sqrt(mat))  * (log(S / K) + (r - vol^2/2) * (mat))
	# d2 <- d1 - vol * sqrt(mat)
	
	call <- pnorm(d1) * S - pnorm(d2) * K * exp(-r * (mat))
	# put <- K * exp(-r * (mat)) - S + call
	put <- pnorm(-d2) * K * exp(-r * (mat)) - pnorm(-d1) * S
	
	return(list(call = call, put = put, d1 = d1, d2 = d2))
}

if(FALSE){
	source("R/bs.R")
	source('tests/test.bs.R')
	test.bs()
}







