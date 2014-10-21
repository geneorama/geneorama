
#' @name seq_range
#' @title Sequence along range
#' @author Gene Leynes
#'
#' @param rng A vector with two elements specifying the "from" and "to" in seq
#' @param ... further arguments passed along to seq
#'
#' @description
#' 		You can feed seq_range the result of `range` i.e. a min and a max.
#' @details
#' 		If the length of rng isn't two, seq_range will take use range(rng) to 
#' 		calculate the range of the sequence.
#'
#' @seealso
#' 	\code{\link[base]{seq}} Underlying function
#' 	
#' @examples
#'	somedates <- as.POSIXct(c("2014-10-13", "2014-10-23", "2014-10-15"))
#'	seq_range(range(somedates), by="day")
#'	
#'	set.seed(1)
#'	seq_range(range(rpois(5, 8)))
#'	set.seed(1)
#'	seq_range(rpois(5, 8))
#'	set.seed(1)
#'	seq_range(rpois(5, 8), by=.5)
#'	set.seed(1)
#'	seq_range(rpois(5, 8), length.out=4)
#'	
#'	

seq_range <- function(rng, ...){
	if(!length(rng) == 2){
		rng <- range(rng)
	}
	seq(from = rng[1], to = rng[2], ...)
}


