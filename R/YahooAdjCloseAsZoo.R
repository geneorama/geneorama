YahooAdjCloseAsZoo <-
function(x,freq='monthly',begin='2000-01-01',end=Sys.timeDate(),debug=FALSE){
	require(fImport)
	if(debug)browser()
	#----------------------------------------------------------------------
	# DEFINE internal DOWNLOAD FUNCTION
	#----------------------------------------------------------------------
	YahooAdjCloseAsZoo.internal=function(x,freq.internal=freq,
				begin.internal=begin,end.internal=end){
		
		tsObject=yahooImport(x, frequency=freq.internal, from=begin.internal, 
				to=end.internal) 
		val=zoo(tsObject@data$Adj.Close, as.Date(rownames(tsObject@data)))
		if(freq=='monthly'){
			# CHANGE TO MONTHLY TIME STEPS
			newdates=as.yearmon(time(val))
			newdates=as.Date(newdates, frac = 1)
			values=as.vector(val)
			val=zoo(values,newdates)
		}
		return(val)
	}
	#----------------------------------------------------------------------
	# MAIN
	#----------------------------------------------------------------------
	if(length(x)>1) {
		temp=list()
		for (i in 1:length(x))
			temp[[i]]=YahooAdjCloseAsZoo.internal(x[i])
		names(temp)=x
		ret=do.call("merge.zoo", temp)
		return(ret)
	}else{
		return(YahooAdjCloseAsZoo.internal(x))
	}
}
