sourceDir <-
function(path, trace = TRUE, ...) {
###     for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
        for (nm in list.files(path, pattern = "\\.[Rr]$")) {
                        if(trace) cat(nm,":")           
                source(file.path(path, nm), ...)
                if(trace) cat("\n")
        }
}
