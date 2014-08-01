round_weeks <- function(x){
	require(data.table)
	dt <- data.table::data.table(i = 1:length(x),
					 day = x,
					 weekday = weekdays(x))
	offset <- data.table::data.table(weekday = c('Sunday', 'Monday', 'Tuesday', 'Wednesday', 
									 'Thursday', 'Friday', 'Saturday'),
						 offset_amt = -(0:6))
	dt <- merge(dt, offset, by="weekday")
    dt[ , day_adj := day + offset_amt]
    setkey(dt, i)
	return(dt[ , day_adj])
}


if(FALSE){
    ## a test:
    require(data.table)
    dd <- seq(as.IDate("2013-12-20"), as.IDate("2014-01-20"), 1)
    round_weeks(dd)
}
    
    