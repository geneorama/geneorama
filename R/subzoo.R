subzoo <-
function(zooobj,start,end){
	t1=which(index(zooobj)==as.Date(start))
	t2=which(index(zooobj)==as.Date(end))
	ret = zooobj[t1:t2,]
	return(ret)
}
