#' @name  saver (DEPRICATED)
#' @title  Saves a single object to a file
#' @author Gene Leynes
#'
#' @param x         filename
#' @param override  overwrite file if it exists?  Default is FALSE.
#'
#' @description
#' 		This was before I knew about saveRDS.
#' 		
#' @details
#' 		Use saveRDS instead
#' 		
#' @seealso
#' 	\code{\link{loader}},
#' 	\code{\link[base]{saveRDS.}}
#'		
#'
#'
#'

saver <- function(x, override=FALSE){
    fname <- paste('Output/',x,'.RData',sep='')
    if(file.exists(fname) & !override){
        warning('A file already exists in ',fname,'\n')
        #cat('A file already exists in ',fname,'\n')
    }else{
        if(as.name(x)=='x'){
            rm(x)
            save(x,file=fname)
        }else{
            eval(substitute(save(variable,file=fname),
                            list(variable = as.name(x))
            ))
        }
    }
}
