json_to_datatable <- function(lst){
    require(jsonlite)
    ret <- list()
    for(i in 1:length(lst)){
        if(i %% 1000 == 1) print(i)
        cur <- fromJSON(lst[[i]])
        for(newname in names(cur)[!names(cur) %in% names(ret)]){
            ret[[newname]] <- vector(mode = class(cur[[newname]]), 
                                     length = length(lst))
        }
        for(curname in names(cur)){
            if(length(cur[[curname]])!=0){
                ret[[curname]][i] <- cur[[curname]]
            }
        }
    }
    ret <- as.data.table(ret)
    return(ret)
    
}
