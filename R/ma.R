#' @name   ma
#' @title  Calculate a rolling average
#' @author Gene Leynes
#' 
#' @param x            Vector to average.
#' @param p            Number of periods to go back.
#' @param sides        Use 1 for trailing average, 2 for center, see Details
#'
#' @description
#' 		Calculates a moving average for p periods.  
#'
#' @details
#'   	The function uses filter, which returns a time series, but that is 
#'   	converted back to a vector.
#'   	
#'   	The sides are passed to the filter function, see that documentation for
#'   	details. The two more useful modes are 1 for a forward looking moving
#'   	average, and 2 for centered. 
#'
#' @seealso
#' 	\code{\link{filter}},
#' 	\code{\link{convolve}}
#'
#' @examples
#'
#'      require(geneorama)
#'
#'      ma(1:20)
#'      ma(c(1:20, rep(NA,3), 21:30))
#'


ma <- function(x, 
			   p = 5,
			   sides = 1){
	ret <- stats::filter(x,
						 rep(1 / p, p), 
						 sides = sides)
	ret <- unclass(ret)
	attr(ret, "tsp") <- NULL
	return(ret)
}

if(FALSE){
	ma(c(1:20, rep(NA,1), 21:30))
	ma(c(1:20, rep(NA,3), 21:30))
	
}

