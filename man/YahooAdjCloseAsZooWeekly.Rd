\name{YahooAdjCloseAsZooWeekly}
\alias{YahooAdjCloseAsZooWeekly}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
YahooAdjCloseAsZooWeekly
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
YahooAdjCloseAsZooWeekly(symbols, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{symbols}{
%%     ~~Describe \code{symbols} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
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
function (symbols, ...) 
{
    require("zoo")
    require("fImport")
    prices = YahooAdjCloseAsZoo(symbols, freq = "weekly", ...)
    prices = split(prices, tolower(substr(weekdays(index(prices)), 
        1, 3)))
    newprices = prices[["mon"]]
    prices[["mon"]] = NULL
    iifull = seq(min(index(newprices)), max(index(newprices)), 
        by = 7)
    iimissing = iifull[!iifull \%in\% index(newprices)]
    for (i in iimissing) {
        newdate = as.Date(i)
        newzooobj = zoo(matrix(NA, ncol = ncol(newprices)), newdate)
        colnames(newzooobj) = colnames(newprices)
        newprices[newdate] = newzooobj
    }
    if ("tue" \%in\% names(prices)) 
        index(prices[["tue"]]) = index(prices[["tue"]]) - 1
    if ("wed" \%in\% names(prices)) 
        index(prices[["wed"]]) = index(prices[["wed"]]) - 2
    if ("thu" \%in\% names(prices)) 
        index(prices[["thu"]]) = index(prices[["thu"]]) - 3
    for (k in names(prices)) {
        ii = index(prices[[k]])
        for (i in ii) {
            i = as.Date(i)
            for (j in 1:length(newprices[i])) {
                if (!is.na(prices[[k]][i, j])) 
                  newprices[i, j] = prices[[k]][i, j]
            }
        }
    }
    newprices
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
