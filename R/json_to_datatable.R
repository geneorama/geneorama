json_to_datatable <- function(lst){
    # browser()
    # require(jsonlite)
    ret <- list()
    for(i in 1:length(lst)){
        if(i %% 1000 == 1) print(i)
        cur <- unlist(fromJSON(lst[[i]]))
        for(newname in names(cur)[!names(cur) %in% names(ret)]){
            ret[[newname]] <- vector(mode = "character", 
                                     length = length(lst))
        }
        for(curname in names(cur)){
            if(!is.null(cur[[curname]])){
                ret[[curname]][i] <- cur[[curname]]
            }
        }
    }
    ret <- lapply(ret, type.convert, na.strings = c("", "NA"), as.is = TRUE)
    ret <- as.data.table(ret)
    return(ret)
}
