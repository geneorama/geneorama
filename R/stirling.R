#' @name   stirling
#' @title  Stirling's approximation for factorials
#' @author Gene Leynes
#' 
#' @param x    A number or vector of numbers
#'
#' @description
#' 		Uses Stirling's Approximation to approximate x!
#'
#' @details
#' 		sqrt(2 * pi * x) * (x / exp(1)) ^ x
#'
#' @seealso
#'		\code{\link[base]{factorial}} Factorials calculated exactly.
#'
#' @examples
#' 		require(geneorama)
#'
#' 		factorial(10)
#' 		stirling(10)
#' 		
#' 		plot(factorial(1:15), type = "o", log = "y")
#' 		lines(stirling(1:15), type = "o", col="red")
#'
#'

stirling <- function(x) {
	sqrt(2 * pi * x) * (x / exp(1)) ^ x
}



