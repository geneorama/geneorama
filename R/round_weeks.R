round_weeks <- function(x){
	require(data.table)
	dt <- data.table(i = 1:length(x),
					 day = x,
					 weekday = weekdays(x))
	offset <- data.table(weekday = c('Sunday', 'Monday', 'Tuesday', 'Wednesday', 
									 'Thursday', 'Friday', 'Saturday'),
						 offset = -(0:6))
	dt <- merge(dt, offset, by="weekday")
	dt[ , day_adj := day + offset]
	dt[ , weekday_adj := weekdays(day_adj)]
	setkey(dt, i)
	return(dt[,day_adj])
}
