getFormals <-
function(x){
	Names = names(formals(x))
	Vals = as.character(formals(x))
	#Vals[Vals=='']="INPUT"
	ret = paste(Names,Vals,sep='=',collapse=', ')
	ret = gsub('\\=$', '', ret)
	ret = gsub('\\=,', ',', ret)
	ret = paste('(',ret,')', sep='')
	ret
}
