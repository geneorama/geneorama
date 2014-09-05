#' @name   convert_datatable_StringDate
#' @title  Find and convert data.table columns from Strings to IDate
#' @author Gene Leynes
#' 
#' @param dat  A data.table
#' @param cols An OPTIONAL subset of columns to search (see details)
#' @param fmt  Format for conversion, default assumes "YYYY-MM-DD HH:MM:SS" 
#'             aka "\%Y-\%m-\%d \%H:\%M:\%S"
#' @param tz   Timezone to convert to (only used for POSIX).  Default is "GMT"
#' 
#' @description
#' 		Converts a data.table's columns from strings to to IDates.  This 
#' 		conversion is done BY REFERENCE meaning that the original data.table is 
#' 		modified.
#' 		
#' @details
#' 		The data.table is returned invisibly if needed.
#' 		
#' 		Only POSIXct is used.
#' 		
#' 		The cols can be specified as a character vector of column names.  The
#' 		entire data.table is returned, but only the columns in "cols" are 
#' 		searched.  A warning is produced if no columns are character.
#' 		
#' @seealso
#' 	\code{\link[data.table]{data.table}}
#' 	\code{\link[data.table]{as.IDate}} 
#' 	\code{\link[data.table]{set}} 
#' 	\code{\link[base]{strptime}} 
#'		
#'
#'
#'

convert_datatable_StringDate <- function(dat, cols, fmt=NULL, tz="GMT", 
										 newclass=c("POSIXct", "IDate", "ITime")[2]){
	# browser()}
	# as.POSIXct(strptime(dat[[cols]][1], "%m/%d/%Y"), tz="GMT")
	
	allowed_Classes <- c("POSIX", "POSIXct", "IDate", "ITime")
	if(!newclass %in% allowed_Classes){
		stop(paste("The target class (newclass) must be one of", allowed_Classes))
	}
	
	## If the user didn't sepcify particular columns, then use all columns
	if(is.null(cols)){
		cols <- colnames(dat)
	}
	## Find columns that match the class
	col_classes <- sapply(dat[ ,cols, with=FALSE], class)
	col_classes_match <- lapply(col_classes, grep, pattern="character")
	cols <- names(which(sapply(col_classes_match, length) != 0))
	
	
	if(length(cols)==0){
		warning("No string columns to convert")
		invisible(dat)
	} else {
		for(col in cols){
			## Remove any pesky blanks ("") and replace with NA
			set(x = dat, j = col, value = ifelse(dat[[col]]=="", NA, dat[[col]]))
			
			if(newclass %in% c("POSIXct", "POSIX")){
				if(is.null(fmt)){
					set(x = dat, 
						j = col, 
						value = as.POSIXct(dat[[col]], tz=tz))
				} else {
					set(x = dat, 
						j = col, 
						value = as.POSIXct(strptime(x = dat[[col]],
													format = fmt),
										   tz = tz))
				}
			}
			if(newclass %in% c("IDate")){
				if(is.null(fmt)){
					set(x = dat, 
						j = col, 
						value = as.IDate(dat[[col]], tz=tz))
				} else {
					set(x = dat, 
						j = col, 
						value = as.IDate(x = dat[[col]], format = fmt))
				}
			}
			if(newclass %in% c("ITime")){
				if(is.null(fmt)){
					set(x = dat, 
						j = col, 
						value = as.ITime(dat[[col]], tz=tz))
				} else {
					set(x = dat, 
						j = col, 
						value = as.ITime(x = dat[[col]], format = fmt))
				}
			}
		}
		invisible(dat)
	}
}

if(FALSE){
	rm(list=ls())
	dt <- data.table(integers = c(1,2,3))
	dt[ , idate := seq(as.IDate("2010-01-01"),as.IDate("2010-01-03"),1)]
	dt[ , posix := as.POSIXct(idate)]
	dt[ , char_posix := as.character(posix)]
	dt[ , posix_datetime := posix + c(12899, 23000, 83000)]
	dt[ , char_posix_datetime := as.character(posix_datetime)]
	dt[ , char_american := c("1/1/10 03:34:59", "1/2/10 06:23:20", 
								  "1/3/10 23:03:20")]
	
	##==========================================================================
	## Test char posix
	##==========================================================================
	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_posix", 
								 tz="GMT", newclass="POSIXct")
	str(dt[,char_posix]);str(dat[,char_posix])
	
	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_posix", 
								 tz="GMT", newclass="IDate")
	str(dt[,char_posix]);str(dat[,char_posix])
	
	##==========================================================================
	## Test  char_posix_datetime
	##==========================================================================
	
	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_posix_datetime", 
								 tz="GMT", newclass="POSIX", 
								 fmt = "%Y-%m-%d %H:%M:%S")
	str(dt[,char_posix_datetime]);str(dat[,char_posix_datetime])
	dat[,char_posix_datetime]
	
	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_posix_datetime", 
								 tz="GMT", newclass="IDate", 
								 fmt = "%Y-%m-%d %H:%M:%S")
	str(dt[,char_posix_datetime]);str(dat[,char_posix_datetime])
	dat[,char_posix_datetime]

	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_posix_datetime", 
								 newclass="IDate", 
								 fmt = "%Y-%m-%d %H:%M:%S")
	str(dt[,char_posix_datetime]);str(dat[,char_posix_datetime])
	dat[,char_posix_datetime]
	
	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_posix_datetime", 
								 newclass="IDate")
	str(dt[,char_posix_datetime]);str(dat[,char_posix_datetime])
	dat[,char_posix_datetime]
	
	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_posix_datetime", 
								 tz="GMT", newclass="ITime", 
								 fmt = "%Y-%m-%d %H:%M:%S")
	str(dt[,char_posix]);str(dat[,char_posix_datetime])
	dat[,char_posix_datetime]
	
	
	##==========================================================================
	## test char american
	##==========================================================================
	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_american", 
								 tz="GMT", newclass="POSIXct")
	str(dt[,char_american]);str(dat[,char_american])
	
	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_american", 
								 fmt <- "%m/%d/%y %H:%M:%S",
								 tz="GMT", newclass="POSIXct")
	str(dt[,char_american]);str(dat[,char_american])
	
	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_american", 
								 fmt <- "%m/%d/%y %H:%M:%S",
								 tz="GMT", newclass="IDate")
	str(dt[,char_american]);str(dat[,char_american])

	dat <- copy(dt)
	convert_datatable_StringDate(dat=dat, cols="char_american", 
								 fmt <- "%m/%d/%y %H:%M:%S",
								 tz="GMT", newclass="ITime")
	str(dt[,char_american]);str(dat[,char_american])
	dat[,char_american]
	
	
	
	# 	as.IDate(dat$char_american[1], "%m/%d/%y")
	# 	fmt <- "%m/%d/%y %H:%M:%S"
	# 	strptime(dat$char_american[1], "%m/%d/%y %H:%M:%S")
	# 	as.ITime(dat$char_american[1], "%m/%d/%y %H:%M:%S")
	# 	as.IDate(dat$char_american[1], "%m/%d/%y %H:%M:%S")
}
