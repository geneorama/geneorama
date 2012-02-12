clipdir <-
function(){
	temp=getwd()[1]
	temp=paste('setwd(\'',temp,'\')',sep='')
	write.table(temp, "clipboard", sep = "\t", 
			col.names=FALSE, row.names=FALSE,quote=FALSE)
	
}
