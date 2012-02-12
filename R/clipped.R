clipped <-
function(lowercase=TRUE,removedot=TRUE){
	x=read.delim("clipboard")
	if (lowercase)	colnames(x)=tolower(colnames(x))
	if (removedot)	colnames(x)=gsub('\\.','',colnames(x))
	return(x)
}
