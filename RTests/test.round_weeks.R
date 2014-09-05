#' Week Rounding Test
#'
#'
#'

# rm(list=ls())
# source("R/round_weeks.R")

test.round_weeks <- function(){

	require("RUnit")
	require("data.table")

	## Example dates:
	dd <- seq(as.IDate("2013-12-22"), as.IDate("2014-01-18"), 1)
	## Rounding in data.table, and using round_weeks:
	round(dd, 'weeks')
	round_weeks(dd)
	## Summary of possible results:
	result1 <- data.table(date_original = dd,
						  weeks_dt = round(dd, 'weeks'),
						  weeks_new = round_weeks(dd),
						  wday = wday(dd),
						  weekday = weekdays(dd))
	result1
	## RUnit test:
	checkTrue(all(sapply(split(result1, result1$weeks_new), nrow) == 7),
			  "Some weeks don't have 7 days")

	invisible(NULL)
}


