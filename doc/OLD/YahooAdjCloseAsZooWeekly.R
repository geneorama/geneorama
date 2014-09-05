YahooAdjCloseAsZooWeekly <-
function(symbols, ...){
    # require('zoo')
    # require('fImport')

    
    prices = YahooAdjCloseAsZoo(symbols, freq='weekly', ...)
    prices = split(prices, tolower(substr(weekdays(index(prices)),1,3)))
    newprices = prices[['mon']]
    prices[['mon']] = NULL
    iifull = seq(min(index(newprices)),max(index(newprices)),by=7)
    iimissing = iifull[!iifull %in% index(newprices)]
    
    for(i in iimissing){
        newdate = as.Date(i)
    	newzooobj = zoo(matrix(NA, ncol=ncol(newprices)),  newdate)
    	colnames(newzooobj) = colnames(newprices)
    	newprices[newdate] = newzooobj
    }
    
    if('tue'%in%names(prices)) index(prices[['tue']]) = index(prices[['tue']]) - 1
    if('wed'%in%names(prices)) index(prices[['wed']]) = index(prices[['wed']]) - 2
    if('thu'%in%names(prices)) index(prices[['thu']]) = index(prices[['thu']]) - 3
    
    
    for(k in names(prices)){
    	ii = index(prices[[k]])
    	for(i in ii){
    		i = as.Date(i)
    		for(j in 1:length(newprices[i])){
    			if(!is.na(prices[[k]][i, j]))
    				newprices[i, j] = prices[[k]][i, j]
    		}
    	}
    }
    
    newprices
}
