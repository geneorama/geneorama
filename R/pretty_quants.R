
pretty_quants <- function(vec, n=10){
    quants <- quantile(vec, na.rm = T, probs = seq(0,1,1/n))
    prettyquants <- sapply(quants, pretty)
    breaks <- unname(c(prettyquants[1,], max(prettyquants)))
    return(breaks)
}

