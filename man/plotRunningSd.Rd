\name{plotRunningSd}
\alias{plotRunningSd}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
plotRunningSd
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plotRunningSd(dat)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dat}{
%%     ~~Describe \code{dat} here~~
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
function (dat) 
{
    require(gtools)
    plot(dat)
    sdfun <- function(x, sign = 1) mean(x) + sign * sd(x)
    lines(running(dat, width = 51, pad = TRUE, fun = mean), col = "blue")
    lines(running(dat, width = 51, pad = TRUE, fun = sdfun, sign = -1), 
        col = "red")
    lines(running(dat, width = 51, pad = TRUE, fun = sdfun, sign = 1), 
        col = "red")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
