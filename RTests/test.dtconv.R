
test.dtconv <- function(){

	require(RUnit)

	dt_orig <- data.table(aa1 = as.integer(c(1,2,3)),
						  aa2 = c('1','2',"3"),
						  aa3 = factor(c(1,2,3)),
						  bb = letters[1:3],
						  cc = factor(letters[1:3]),
						  dd = as.POSIXct(c("2014-08-27 17:29:15 CDT",
						  				  "2014-08-28 17:29:15 CDT",
						  				  "2014-08-29 17:29:15 CDT")),
						  ee = c("2014-08-27 17:29:15 CDT",
						  	   "2014-08-28 17:29:15 CDT",
						  	   "2014-08-29 17:29:15 CDT"),
						  ff = c("2014-08-27",
						  	   "2014-08-28",
						  	   "2014-08-29"),
						  gg = c(1409115600, 1409202000, 1409288400),
						  hh = c(1409115600000, 1409202000000, 1409288400000),
						  mm = c("$222.22", "$8,888.88", "$444.44"))

	## Creating a copy of the data table

	##==========================================================================
	## Testing IDate
	##==========================================================================
	dt <- data.table::copy(dt_orig)
	str(dt)
	checkException(
		dtconv(dt = dt,
			   newclass <- "IDate",
			   columns <- c("dd","ee","ff","gg")),
		msg = "shouldn't be supported",
		silent = TRUE)
	str(dt)

	### Function:
	dt <- data.table::copy(dt_orig)
	str(dt)
	dtconv(dt = dt,
		   newclass <- "IDate",
		   columns <- c("dd","ee","ff","gg"))
	str(dt)

	### Manual:
	dt <- data.table::copy(dt_orig)
	data.table::set(x = dt,
					j = "ee",
					value = as.IDate(dt[["ee"]]))
	str(dt)


	##==========================================================================
	dt <- data.table::copy(dt_orig)
	dt_result <- dtconv(dt = dt,
						newclass <- "numeric",
						columns <- c("aa1", "aa2", "aa3", "cc"),
						copy = TRUE)
	str(dt)
	str(dt_result)

	dt <- data.table::copy(dt_orig)
	dt_copy <- data.table::copy(dt)
	dtconv(dt = dt,
		   newclass <- "numeric",
		   columns <- c("aa1", "aa2", "aa3", "cc"),
		   copy = FALSE)
	str(dt)
	str(dt_copy)


	newclass <- "POSIXct"; columns <- c("dd","ee","ff","gg")
	newclass <- "character"
	newclass <- "factor"

	str(dt[, as.character(.SD)])

	dt_str = copy(dt)
	for(j in 1:ncol(dt)){
		set(dt_str, j=j, value = as.character(dt[[j]]))
	}
	str(dt_str)
	str(type.convert(dt_str[[1]]))
	str(type.convert(dt_str[["hh"]]))
	str(type.convert(dt_str[["ee"]]))
	str(type.convert(dt_str[["ff"]]))
	str(lapply(dt_str, type.convert))
	rm(dt_str)

}

