\name{NAsummary}
\alias{NAsummary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
NAsummary
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
NAsummary(df, include.nan = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{df}{
%%     ~~Describe \code{df} here~~
}
  \item{include.nan}{
%%     ~~Describe \code{include.nan} here~~
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
function (df, include.nan = FALSE) 
{
    newdf = data.frame(col = 1:ncol(df), Count = nrow(df), nNA = sapply(df, 
        function(x) length(x[is.na(x)])))
    newdf$rNA = newdf$nNA/newdf$Count
    newdf$rNA = trunc(newdf$rNA * 10000)/10000
    if (include.nan) {
        newdf$nNan = sapply(df, function(x) length(x[is.nan(x)]))
        newdf$rNan = newdf$nNan/newdf$Count
        newdf$rNan = trunc(newdf$rNan * 10000)/10000
    }
    newdf$nUnique = sapply(df, function(x) length(unique(x)))
    newdf$rUnique = newdf$nUnique/newdf$Count
    newdf$rUnique = trunc(newdf$rUnique * 10000)/10000
    rownames(newdf) = colnames(df)
    return(newdf)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
