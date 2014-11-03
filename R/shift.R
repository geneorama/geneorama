#' @name shift
#' @title Shift a vector an arbitrary amount
#' @author Gene Leynes (originally dnlbrky \url{http://stackoverflow.com/users/1344789/dnlbrky})
#'
#' @param x     Vector to be shifted
#' @param shift Quantity to shift (forward or backward)
#' @param pad   Value to use for padding 
#'
#' @description
#' 		Shift a variable by an amount, and pad with NA or your value of choice.
#' 		
#' @note
#' 		Can shift forward or backwards
#'
#' @source
#' 		\url{http://stackoverflow.com/questions/14689424/use-a-value-from-the-previous-row-in-an-r-data-table-calculation}
#' 		
#' @examples
#' 		shift(1:10, 3)
#'      ## [1]  4  5  6  7  8  9 10 NA NA NA
#'		
#' 		shift(1:10, -1)
#'      ## [1]  4  5  6  7  8  9 10 NA NA NA
#'      
#'      as.data.table(faithful)[1:5,list(eruptLengthCurrent=eruptions,
#'                                       eruptLengthTwoPrior=shift(eruptions,-2,0), 
#'       								 eruptLengthThreeFuture=shift(eruptions,3))]
#'      # eruptLengthCurrent eruptLengthTwoPrior eruptLengthThreeFuture
#'      # 1:              3.600               0.000                  2.283
#'      # 2:              1.800               0.000                  4.533
#'      # 3:              3.333               3.600                     NA
#'      # 4:              2.283               1.800                     NA
#'      # 5:              4.533               3.333                     NA
#'      
#'      shift(1:10, 3, NaN)
#'      # [1]   4   5   6   7   8   9  10 NaN NaN NaN
#'

shift <- function(x, offset = 1, pad = NA) {
 	r <- (1 + offset):(length(x) + offset)
	r[r<1] <- NA
	ans <- x[r]
	ans[is.na(ans)] <- pad
	return(ans)
}





