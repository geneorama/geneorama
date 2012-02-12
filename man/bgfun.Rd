\name{bgfun}
\alias{bgfun}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
bgfun
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bgfun(color = "honeydew2", linecolor = "grey45", addgridlines = TRUE, debug = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{color}{
%%     ~~Describe \code{color} here~~
}
  \item{linecolor}{
%%     ~~Describe \code{linecolor} here~~
}
  \item{addgridlines}{
%%     ~~Describe \code{addgridlines} here~~
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
function (color = "honeydew2", linecolor = "grey45", addgridlines = TRUE, 
    debug = FALSE) 
{
    if (debug) 
        browser()
    tmp = par("usr")
    rect(tmp[1], tmp[3], tmp[2], tmp[4], col = color)
    if (addgridlines) {
        ylimits = par()$usr[c(3, 4)]
        abline(h = pretty(ylimits, 10), lty = 2, col = linecolor)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
