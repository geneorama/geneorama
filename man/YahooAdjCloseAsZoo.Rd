\name{YahooAdjCloseAsZoo}
\alias{YahooAdjCloseAsZoo}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
YahooAdjCloseAsZoo
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
YahooAdjCloseAsZoo(x, freq = "monthly", begin = "2000-01-01", end = Sys.timeDate(), debug = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{freq}{
%%     ~~Describe \code{freq} here~~
}
  \item{begin}{
%%     ~~Describe \code{begin} here~~
}
  \item{end}{
%%     ~~Describe \code{end} here~~
}
  \item{debug}{
%%     ~~Describe \code{debug} here~~
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
function (x, freq = "monthly", begin = "2000-01-01", end = Sys.timeDate(), 
    debug = FALSE) 
{
    require(fImport)
    if (debug) 
        browser()
    YahooAdjCloseAsZoo.internal = function(x, freq.internal = freq, 
        begin.internal = begin, end.internal = end) {
        tsObject = yahooImport(x, frequency = freq.internal, 
            from = begin.internal, to = end.internal)
        val = zoo(tsObject@data$Adj.Close, as.Date(rownames(tsObject@data)))
        if (freq == "monthly") {
            newdates = as.yearmon(time(val))
            newdates = as.Date(newdates, frac = 1)
            values = as.vector(val)
            val = zoo(values, newdates)
        }
        return(val)
    }
    if (length(x) > 1) {
        temp = list()
        for (i in 1:length(x)) temp[[i]] = YahooAdjCloseAsZoo.internal(x[i])
        names(temp) = x
        ret = do.call("merge.zoo", temp)
        return(ret)
    }
    else {
        return(YahooAdjCloseAsZoo.internal(x))
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
