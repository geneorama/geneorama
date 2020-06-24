denull <- function(veclist){
    ret <- vector("character", length(veclist))
    for(i in 1:length(veclist)) {
        ret[i] <- ifelse(is.null(unlist(veclist[[i]])), 
                         NA, 
                         unlist(veclist[[i]]))
    }
    ret
}
if(FALSE){
    l <- list(
        list(name="Foo",age=22),
        list(name="Bar"),
        list(name="Baz",age=NULL)
    )
    ex <- lapply(l, `[`, "age")
    ans <- denull(ex)
    table(ans, useNA = "ifany")
    ans <- denull(dt$district)
    table(ans, useNA = "ifany")
    
}
