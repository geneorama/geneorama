printDebugMessage <-
function(DebugMode, msg=NULL, indent=0){
	CurCallDepth = length(sys.calls())
	if(CurCallDepth==1){
		PreviousFunction='TopLevel'
	}else{
		PreviousCall = sys.calls()[[CurCallDepth-1]]
		PreviousFunction = as.character(PreviousCall)[1]
	}
	RepLetter = substr(gsub('[a-z]','',PreviousFunction), 1, 1)
	if(RepLetter=="") RepLetter = "%"
	
	if(is.null(msg)) msg='START'
	msgIsStart = length(grep('[Ss][Tt][Aa][Rr][Tt]',msg))!=0
	if(DebugMode & indent==0 & msgIsStart) {
		cat('\n', paste(rep(RepLetter, 56), collapse=''), '\n')
	}
	if(DebugMode) {
			cat(rep('\t', indent), PreviousFunction, '-', msg, '\n')
	}
}
