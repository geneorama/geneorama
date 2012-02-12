inin <-
function(x,y,debug=FALSE){
	if(debug==TRUE)browser()
	if(!is.null(dim(x)) | !is.null(dim(y))) {
		print("Requires vector args")
		return(NULL)
	}
	lenx=length(x)
	leny=length(y)
	tab1=table(x %in% y,useNA='ifany')
	tab2=table(y %in% x,useNA='ifany')
	xiny=tab1['TRUE'][[1]];xiny
	yinx=tab2['TRUE'][[1]];yinx
	xnotiny=tab1['FALSE'][[1]];xnotiny
	ynotinx=tab2['FALSE'][[1]];ynotinx

	xx=data.frame("inin summary"=c(
		"Items in X"=lenx,
		"Items in Y"=leny,
		"Items in X and Y"=xiny,
		"Items in X but not in Y"=xnotiny,
		"Items in Y but not in X"=ynotinx))
	
	rownames(xx)=gsub('X',deparse(substitute(x)),rownames(xx))
	rownames(xx)=gsub('Y',deparse(substitute(y)),rownames(xx))
	
	return(xx)
	
}
