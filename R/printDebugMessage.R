#' @name   printDebugMessage
#' @title  Embed within functions to optionally print debug mesagges at run time
#' @author Gene Leynes
#'
#' @param DebugMode   Are you in debug mode now?  Default is FALSE 
#' @param msg         Message to print.  Default is NULL
#' @param indent      How far should msg be indented?  Default is 0, but 
#'                    it's also modified internally
#'
#' @description
#' 		Prints messages at runtime, optionally, at various levels to help debug.
#' 		
#' @details
#' 		some details are... comming soon.
#'
#' 		
#'		
#'
#'
#'

printDebugMessage <- function(DebugMode, msg=NULL, indent=0){
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
