NAsummary <-
function(df, include.nan=FALSE){
	newdf = data.frame(
			col=1:ncol(df),
			Count =nrow(df),
			nNA = sapply(df,function(x)length(x[is.na(x)]))
	)
	
	newdf$rNA = newdf$nNA / newdf$Count
	newdf$rNA = trunc(newdf$rNA*10000)/10000
	
	if(include.nan){
		newdf$nNan = sapply(df,function(x)length(x[is.nan(x)]))
		newdf$rNan = newdf$nNan / newdf$Count
		newdf$rNan = trunc(newdf$rNan*10000)/10000
	}
	
	newdf$nUnique = sapply(df,function(x)length(unique(x))) 
	
	newdf$rUnique = newdf$nUnique / newdf$Count
	newdf$rUnique = trunc(newdf$rUnique*10000)/10000
	
	rownames(newdf) = colnames(df)
	return(newdf)
}
