#' @name   mmstdev
#' @title  Using the method of moments to calculate a standard deviation
#' @author Gene Leynes
#' 
#' @param x    A number or vector of numbers
#' 
#' @description
#' 		Uses the method of moments to calculate the sample standard deviation.
#'
#' @details
#' 		Why would you want to do this?  You wouldn't.  You should use `sd`.
#' 		
#' 		This is just to document how to do it, so that the steps are available
#' 		within the function definition.  The steps are useful if you're trying
#' 		to calculate stdev within a map reduce framework, apply a rolling
#' 		standard deviation, or calculate a weighted standard deviation.
#' 		
#' 		This function uses the form
#' 		  ( E[X] ^ 2 -  E[X ^ 2] ) * (N / (N - 1))
#'
#' @seealso
#'		\code{\link[base]{sd}} Standard deviation.
#'
#' @examples
#' 		require(geneorama)
#'
#' 		set.seed(10)
#'		examp <- runif(n = 10, min = 4, max = 13)
#' 		
#' 		sd(examp)
#' 		lines(stirling(1:15), type = "o", col="red")
#'
#'

mmstdev <- function(x) {
	N <- length(x)
	part1 <- sum(x ^ 2) / N
	part2 <- (sum(x) / N) ^ 2
	ret <- sqrt((part1 - part2) * N / (N - 1))
	return(ret)
}



