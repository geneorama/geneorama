clipper <-
function(x)
	#write.table(x,"clipboard",sep="\t",col.names=NA)
	write.table(x,"clipboard",sep="\t",col.names=TRUE,row.names=FALSE)
