#' @name   nokey
#' @title  Return a copy of a data.table without the key
#' @author Gene Leynes
#' 
#' @param dt           A data.table with (or without) a key
#' @param usestrings   TRUE or FALSE - If performance is poor with 
#'					   usestrings = TRUE, then try setting usestrings = FALSE
#'
#' @description
#' 		Return the data.table with only the non-key columns.
#'
#' @details
#'   	Uses .SD and .SDcol to do the subsetting (by default).  This can be 
#'      slow, so there is also an option to use the strings to subset the 
#'      the columns.
#'
#' @seealso
#' 	\code{\link[data.table]{data.table}}
#' 	\code{\link[data.table]{setkey}}
#' 	\code{\link[data.table]{key}}
#'
#' @examples
#'
#' dt_longley <- data.table(year = as.integer(rownames(longley)),
#'                          GNP = longley$GNP,
#'                          Unemployed = longley$Unemployed)
#' dt_sunspots <- data.table(year = as.integer(time(sunspot.year)),
#'                           sunspots = as.integer(sunspot.year),
#'                           key = "year")
#' dt_model <- dt_sunspots[dt_longley]
#' 
#' ## We don't want to regress on the key "year"!
#' summary(lm(GNP~., dt_model))$coef
#' #                  Estimate   Std. Error      t value     Pr(>|t|)
#' # (Intercept) -4.320245e+04 845.45463019 -51.09966406 2.071517e-15
#' # year         2.232154e+01   0.43481740  51.33542936 1.960650e-15
#' # sunspots     2.491893e-03   0.02519022   0.09892303 9.228327e-01
#' # Unemployed  -1.175555e-01   0.02253020  -5.21768359 2.155365e-04
#'
#' ## This makes more sense:
#' summary(lm(GNP~., nokey(dt_model)))$coef
#' #                Estimate Std. Error    t value   Pr(>|t|)
#' # (Intercept) 198.4062549 78.6665975  2.5221156 0.02550192
#' # sunspots     -0.2825965  0.3506266 -0.8059756 0.43475304
#' # Unemployed    0.6776781  0.2334579  2.9027853 0.01234176
#' 
#'

nokey <- function(dt, usestrings = FALSE){
    require(data.table)
    
    if(!inherits(x = dt, what = "data.table")){
        stop("dt should be a data.table")
    }
    
    if(haskey(dt)){
        if(usestrings) {
            colskeep <- grep(key(dt), colnames(dt), invert = TRUE)
            ret <- dt[ , colskeep, with = FALSE]
        } else {
            ret <- dt[ , .SD, .SDcol = -key(dt)]
        }
    } else {
        ret <- dt
    }
    
    return(ret)
}

