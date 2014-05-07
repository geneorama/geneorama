

wtf <- function (x) {
    tempFilePath <- paste(tempfile(), ".csv")
    tempPath <- dirname(tempFilePath)
    preferredFile <- paste(deparse(substitute(x)), ".csv", sep = "")
    preferredFilePath <- file.path(tempPath, preferredFile)
    
    if(length(dim(x)) > 2){
        stop('Too many dimensions')
    }
    
    if(is.null(dim(x))){
        x <- as.data.frame(x)
    }
    if (is.null(rownames(x))) {
        tmp <- 1:nrow(x)
    }else {
        tmp <- rownames(x)
    }
    rownames(x) <- NULL
    x <- data.frame(RowLabels = tmp, x)
    WriteAttempt <- try(
        write.table(x, file=preferredFilePath, quote=TRUE, sep=",", na="",
                    row.names=FALSE, qmethod="double"),
        silent = TRUE)
    if ("try-error" %in% class(WriteAttempt)) {
        write.table(x, file=tempFilePath, , quote=TRUE, sep=",", na="",
                    row.names=FALSE, qmethod="double")
        shell.exec(tempFilePath)
    } else {
        shell.exec(preferredFilePath)
    }
}


if(FALSE){
rm(list=ls())
source('functions/wtf.R')
df <- data.frame(
    area = unname(state.x77[,'Area']),
    frost = unname(state.x77[,'Frost']),
    comments = "Ok for a visit, but don't want to live there",
    challengeComments = c('"', '""'))
row.names(df) <- state.name
df <- df[1:10, ]
df['California', 'comments'] = "Would like to live here"
wtf(df)

mat <- matrix(rnorm(100), 10)
wtf(mat)

v <- 1:10
wtf(v)
    
}
