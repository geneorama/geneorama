#' @name   bs_withdiv
#' @title  Black Scholes Calculator (with dividend)
#' @author Gene Leynes
#' 
#' @param S   Current stock price
#' @param K   Strike price
#' @param r   Risk free rate of return
#' @param vol Volatility of the stock expressed as \eqn{\sigma}{\sigma}
#' @param mat Time to maturity
#' @param q   Dividend rate, continuous
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
#' 	\code{\link{bs}}
#'
#' @examples
#' 		bs_withdiv(S=370, K=485, r=.04, vol=.1, mat=2, q=0)
#' 		bs_withdiv(S=370, K=485, r=.04, vol=.1, mat=2, q=.01)
#'
#'

bs_withdiv <- function(S, K, r, vol, mat, q=0){
	
	d1 <- (log(S / K) + (r - q + (vol^2)/2) * mat) / (vol * sqrt(mat))
	d2 <- d1 - vol * sqrt(mat)
	
	call <- pnorm(d1) * S * exp(-q * mat) - pnorm(d2) * K * exp(-r * mat)
	put <- call - S * exp(-q * mat) + K * exp(-r * mat)
	
	return(list(call = call, put = put, d1 = d1, d2 = d2))
}

if(FALSE){
	
	rm(list=ls())
	
	source("R/bs_withdiv.R")
	source('tests/test.bs_withdiv.R')
	test.bs_withdiv()
	
	
}







