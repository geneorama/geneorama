headstr <-
function(x,nrows=5,ncols=25){
	# MAKE SURE THAT a&b MAKE SENSE
	nrows=min(nrow(x),nrows)
	ncols=min(ncol(x),ncols)
	
	# PRINT ROW INFORMATION
	cat('Row Names: (', nrows, ' of ', nrow(x),' rows shown) \n',sep='')
	print(rownames(x)[1:nrows])
	cat('\n')
	#for (i in 1:nrows) print(rownames(x)[i])
	#cat('\n')
	
	# PRINT COLUMN INFORMATION
	cat('Column Names: (', ncols, ' of ', ncol(x),' columns shown)\n',sep='')
	print(colnames(x)[1:ncols])
	cat('\n')
	#for (i in 1:ncols) print(colnames(x)[i])
	#cat('\n')
	
	# PRINT TOTAL SIZE SUMMARY (ROWS BY COLUMNS)
	if(ncols<ncol(x))
		cat('The structure of the first', ncols, 'of', ncol(x), 'Columns:\n\n',sep=' ')
	# PRINT "str" FOR FIRST "a" ROWS OF DATAFRAME
	str(x[,1:ncols])
}
