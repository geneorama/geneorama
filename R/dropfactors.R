dropfactors <-
function(dat){
	for(j in 1:ncol(dat)){
		if(class(dat[,j])=='factor'){
			print(colnames(dat)[j])
			dat[,j] = factor(dat[,j])
		}
	}
	return(dat)
}
