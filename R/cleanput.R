cleanput <- function(df){
    tmp <- tempfile()
    dput(df, tmp, control = c("keepNA", "keepInteger", "showAttributes"))
    txt <- readLines(tmp)
    txt <- gsub("^ +", "", txt)
    txt <- paste(txt, collapse = "")
    txt <- gsub("\\\"", "'", txt)
    txt <- strsplit(txt, "),")[[1]]
    txt <- rev(c(rev(txt)[1], paste0(rev(txt)[-1], "),")))
    unlink(tmp)
    writeLines(txt, tmp)
    system(paste("cat ", tmp))
}
