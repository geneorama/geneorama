\name{plot100colors}
\alias{plot100colors}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
plot100colors
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot100colors(x)
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
    dat = data.frame(x = rep(1:10, each = 10), y = rep(1:10, 
        10))
    dat$y = 11 - dat$y
    z = matrix(x:(x + 99), 10, 10, byrow = TRUE)
    plot(dat, cex = 5, col = colors()[z], pch = 16, yaxt = "n", 
        xaxt = "n", xlab = "", ylab = "")
    points(dat, cex = 5, pch = 21, lwd = 1)
    text(dat$x, dat$y - 0.3, colors()[z], cex = 0.6)
    text(dat$x, dat$y - 0.4, z, cex = 0.6)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
