\name{headstr}
\alias{headstr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
headstr
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
headstr(x, nrows = 5, ncols = 25)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{nrows}{
%%     ~~Describe \code{nrows} here~~
}
  \item{ncols}{
%%     ~~Describe \code{ncols} here~~
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
function (x, nrows = 5, ncols = 25) 
{
    nrows = min(nrow(x), nrows)
    ncols = min(ncol(x), ncols)
    cat("Row Names: (", nrows, " of ", nrow(x), " rows shown) \n", 
        sep = "")
    print(rownames(x)[1:nrows])
    cat("\n")
    cat("Column Names: (", ncols, " of ", ncol(x), " columns shown)\n", 
        sep = "")
    print(colnames(x)[1:ncols])
    cat("\n")
    if (ncols < ncol(x)) 
        cat("The structure of the first", ncols, "of", ncol(x), 
            "Columns:\n\n", sep = " ")
    str(x[, 1:ncols])
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
