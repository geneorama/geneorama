enclose <-
function(x){
	step1=paste(x,collapse='\', \'')
	step2=paste('c(\'',step1,'\')',sep='')
	return(step2)
}
