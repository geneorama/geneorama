list2matrix <- function(mylist){
    Universe <- unique(unlist(mylist))
    Universe <- Universe[!is.na(Universe)]
    importlist_collapse <- vector(mode = "character", 
                                  length = length(mylist))
    for(i in 1:length(importlist_collapse)) {
        importlist_collapse[i] <- paste(mylist[[i]], collapse = ", ")
    }
    mat <- matrix(data = 0, 
                  nrow = length(importlist_collapse), 
                  ncol = length(Universe))
    for(j in 1:length(Universe)){
        ii <- grep(Universe[j], importlist_collapse)
        if(length(ii) > 0){
            mat[ii , j] <- 1
        }
    }
    rownames(mat) <- names(mylist)
    colnames(mat) <- Universe
    mat    
}
