dftab <- function(x, total=TRUE, sort=TRUE) {
	df <- table(x, useNA='ifany')
	if(sort) df <- df[order(df)]
	if(!sort) df <- df[unique(x)]
	names(df)[is.na(names(df))] <- 'NA'
	df <- data.frame(count=df)
	if (total) df <- rbind(df,TOTAL=sum(df))
	return(df)
}
