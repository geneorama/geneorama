wtt <-
function(x){
	#if(debug==TRUE)browser()
	
	## New:
	if(require(PBSmodelling)){
		fpnameTemp=paste(tempfile(), '.csv')
		fnameTemp=basename(fpnameTemp)
		pname=dirname(fpnameTemp)
		fname=paste(deparse(substitute(x)),'.csv',sep='')
		fpname=paste(pname, fname, sep='/')
		
		if(is.null(rownames(x))){
			tmp=1:nrow(x)
		}else{
			tmp=rownames(x)
		}
		rownames(x)=NULL
		x=data.frame(RowLabels=tmp, x)
		## USE "TRY" TO WRITE CSV FILE
		## THIS WILL TEST IF THE USER ALREADY HAS A FILE IN THIS LOCATION
		## IN THAT CASE, GENERATE A FILE WITH THE UNIQUE "TEMP" NAME
		WriteAttempt=try(
				write.table(x, file=fpname, append=F, quote=FALSE, 
						sep = ",", eol = "\n", na="", dec=".", row.names=FALSE, 
						col.names=TRUE, qmethod=c("escape", "double")), silent=TRUE)
		if("try-error" %in% class(WriteAttempt)){
			write.table(x, file=fpnameTemp, append=F, quote=FALSE, 
					sep = ",", eol = "\n", na="", dec=".", row.names=FALSE, 
					col.names=TRUE, qmethod=c("escape", "double"))
			openFile(fpnameTemp)
		}else{
			openFile(fpname)
		}
	}else{
		dpath=gsub('My Documents','Desktop',Sys.getenv("HOME"))
		dpath=gsub('Documents','Desktop',dpath)
		# added 6/7/10
		dpath=if(!Sys.getenv("USERPROFILE")=='')
			paste(Sys.getenv("USERPROFILE"),'Desktop',sep='\\')
		
		fname=paste(dpath,'temp.csv',sep='\\');dpath
		
		# If appending to the file, add a space first:
		if(appendfile)cat('\n' , file=fname, append=TRUE)
		
		#if x is a vector, transpose x into a row, 
		#   then make the first element the variable name
		#if x is a matrix, then make the first column the rownames and 
		#   the name of the column with row names = the variable name
		
		if(is.null(dim(x))){
			xx=data.frame(x)
			names(xx)=deparse(substitute(x))
			xx=cbind(' '=1:length(x),xx)
		}else{
			dat=as.data.frame(x)
			temp=data.frame(' '=rownames(dat))
			names(temp)=deparse(substitute(x))
			xx=cbind(temp,x)
		}
		write.table(xx, file=fname, 
				append=appendfile, quote=TRUE, sep=",",
				eol="\n", na="", dec=".", row.names=FALSE,
				col.names=TRUE, qmethod=c("escape", "double"))
	}
	
}
