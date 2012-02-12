\name{wtt}
\alias{wtt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Write Temp File (CSV Format)
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
wtt(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x) 
{
    if (require(PBSmodelling)) {
        fpnameTemp = paste(tempfile(), ".csv")
        fnameTemp = basename(fpnameTemp)
        pname = dirname(fpnameTemp)
        fname = paste(deparse(substitute(x)), ".csv", sep = "")
        fpname = paste(pname, fname, sep = "/")
        if (is.null(rownames(x))) {
            tmp = 1:nrow(x)
        }
        else {
            tmp = rownames(x)
        }
        rownames(x) = NULL
        x = data.frame(RowLabels = tmp, x)
        WriteAttempt = try(write.table(x, file = fpname, append = F, 
            quote = FALSE, sep = ",", eol = "\n", na = "", dec = ".", 
            row.names = FALSE, col.names = TRUE, qmethod = c("escape", 
                "double")), silent = TRUE)
        if ("try-error" \%in\% class(WriteAttempt)) {
            write.table(x, file = fpnameTemp, append = F, quote = FALSE, 
                sep = ",", eol = "\n", na = "", dec = ".", row.names = FALSE, 
                col.names = TRUE, qmethod = c("escape", "double"))
            openFile(fpnameTemp)
        }
        else {
            openFile(fpname)
        }
    }
    else {
        dpath = gsub("My Documents", "Desktop", Sys.getenv("HOME"))
        dpath = gsub("Documents", "Desktop", dpath)
        dpath = if (!Sys.getenv("USERPROFILE") == "") 
            paste(Sys.getenv("USERPROFILE"), "Desktop", sep = "")
        fname = paste(dpath, "temp.csv", sep = "")
        dpath
        if (appendfile) 
            cat("\n", file = fname, append = TRUE)
        if (is.null(dim(x))) {
            xx = data.frame(x)
            names(xx) = deparse(substitute(x))
            xx = cbind(` ` = 1:length(x), xx)
        }
        else {
            dat = as.data.frame(x)
            temp = data.frame(` ` = rownames(dat))
            names(temp) = deparse(substitute(x))
            xx = cbind(temp, x)
        }
        write.table(xx, file = fname, append = appendfile, quote = TRUE, 
            sep = ",", eol = "\n", na = "", dec = ".", row.names = FALSE, 
            col.names = TRUE, qmethod = c("escape", "double"))
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
