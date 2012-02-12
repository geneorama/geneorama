stacker <-
function(x,id=NULL,vars=NULL,labs=c('variable','value')){
	## SAMPLE USAGE:
	if(FALSE){
		dat=data.frame(
				groups1=as.factor(sample(letters,100, replace=TRUE)),
				groups2=as.factor(sample(LETTERS,100, replace=TRUE)),
				var1=rnorm(100),
				var2=rnorm(100,4,3),
				var3=rnorm(100,-4,3),
				var4=rnorm(100,4,30))
		stdat = stacker(dat, id='groups1', vars=c('var1', 'var2', 'var3'))
		str(stdat)
		stdat = stacker(dat, id='groups1', vars=c('var1', 'var2', 'varx'))
	}
	
	## Check that the user entered the id and vars labels
	if(is.null(id)|is.null(vars))stop('Please specify ids and vars')
	
	## Check that the labels are found in the data
	if(!all(c(id, vars)%in%colnames(x))){
		varsNotFound = c(id, vars)[!(c(id, vars)%in%colnames(x))]
		stop(paste('The following variables were not found:', varsNotFound))
	}
	xx=x[,vars]
	xid=data.frame(x[,id])
	temp1=rep(names(xx),each=nrow(x))
	temp2=as.vector(apply(xx,2,'['))
	
	if(any(is.na(id)))return(temp2)
	rownames(x)=NULL
	ret=data.frame(variable=temp1,value=temp2)
	#tricky part: append the id's backwards
	# so that they wind up in the same order at the beginning
	for (i in seq(ncol(xid))){
		j=ncol(xid)-i+1
		if(class(xid[,j])=='yearmon'){
			xid[,j]=as.character(xid[,j])
			ret=cbind(xid[,j],ret)
			ret[,i]=as.yearmon(ret[,i],'%b%Y')
		}else{
			ret=cbind(xid[,j],ret)
		}
	}
	if(is.character(id)){
		names(ret)=c(id,labs)
	}else{
		names(ret)=c(names(x[,id]),labs)
	}
	return(ret)
}
