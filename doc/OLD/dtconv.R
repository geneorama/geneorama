#' @title  dtconv
#' @name   dtconv
#' @author Gene Leynes
#' 
#' @param dt        A data.table to be converted by reference (the default)
#' @param newclass  The desired new class
#' @param columns   The columns to be converted
#' @param copy      Should dtconv make a copy of dt? Default value is FALSE, 
#'                  i.e. the data.table is modified by REFERENCE
#'
#'
#' @description
#' 		Convert columns of data.table objects.
#'
#' 		This function easily converts the column classes of data.table objects by
#' 		passing in the column names, and the desired new class.
#'
#'
#'



dtconv <- function(dt, newclass, columns, copy=FALSE, dateformat=NULL,
                   dateorigin=NULL, remove_pattern=NULL){
    # browser()
    # library(data.table)

    ## Copy the data table if not modifying in place
    if(copy){
        dat <- data.table::copy(dt)
    } else {
        dat <- dt
    }

    ## Don't allow length of newclass > 1
    if(length(newclass) != 1){
        stop("Argument newclass should be of length 1")
    }

    ## Don't allow length of newclass > 1
    if(!all(columns %in% colnames(dt))){
        ColNotFound <- columns[which(!columns %in% colnames(dt))]
        stop(paste(ColNotFound, "is/are not in dt"))
    }

    
	## Substitute out pattern if present
	if(!is.null(remove_pattern)){
	    for(j in columns){
			data.table::set(x = dat,
			                j = j,
							value = gsub(remove_pattern,"", dat[[j]]))
        }
	}
	
	## Switch behavior based on new class
    switch(newclass,
           "numeric" = {
               for(j in columns){
                   data.table::set(x = dat,
                                   j = j,
                                   value = as.numeric(dat[[j]]))
               }
           },
           "integer" = {
               for(j in columns){
                   data.table::set(x = dat,
                                   j = j,
                                   value = as.integer(dat[[j]]))
               }
		   },
		   "IDate" = {
               for(j in columns){
				   if(is.null(dateformat)){
				   print(11)
					   data.table::set(x = dat,
									   j = j,
									   value = as.IDate(dat[[j]]))
				   } else {
				   print(22)
					   data.table::set(x = dat,
									   j = j,
									   value = as.IDate(dat[[j]]),
									                    dateformat)
				   }
               }
		   },
		   "POSIXct" = {
               for(j in columns){
				   if(is.null(dateformat)){
					   data.table::set(x = dat,
									   j = j,
									   value = as.POSIXct(dat[[j]]))
				   } else {
					   data.table::set(x = dat,
									   j = j,
									   value = as.POSIXct(dat[[j]]),
									                      dateformat)
				   }
               }
		   },
           {
		       stop(paste0("Class is not supported:", newclass))
		   })


    ## Only return the object visibly if making a copy
    if(copy){
        return(dat)
    } else {
        invisible(dat)
    }
}



