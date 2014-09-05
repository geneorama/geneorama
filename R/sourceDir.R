#' @name   sourceDir
#' @title  Source all files within a directory
#' @author Unknown
#'
#' @param path    The path to source
#' @param trace   Trace output
#' @param ...     Other options passed to source
#'
#' @description
#' 		Run "source" on all the file in a folder.
#' 		
#' @details
#' 		This came from the example in ?source
#'
#' @source
#' 		?source
#' 		
#' @seealso
#' 	\code{\link[base]{source}}
#'		
#'
#'
#'



sourceDir <- function(path, trace = TRUE, ...) {
###     for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
        for (nm in list.files(path, pattern = "\\.[Rr]$")) {
                        if(trace) cat(nm,":")           
                source(file.path(path, nm), ...)
                if(trace) cat("\n")
        }
}
