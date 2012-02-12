comma <-
function(x,nDigits=2){
	nDigits2=trunc(log(abs(x),10))+1+nDigits
	#formatC(x, digits=nDigits2, big.mark=',')
	mapply(formatC, x=x, digits=nDigits2, big.mark=',')
}
