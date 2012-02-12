makegroups <-
function(dat, num, sample=FALSE){
	if(sample)dat=sample(dat)
	len=length(dat)
	groups = gl(num, len/num)
	return(split(dat,groups))
}
