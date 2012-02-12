\name{boxplot2}
\alias{boxplot2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
boxplot2
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
boxplot2(x, y, fgcol = "plum3", bgcol = "lightyellow", addgridlines = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
}
  \item{fgcol}{
%%     ~~Describe \code{fgcol} here~~
}
  \item{bgcol}{
%%     ~~Describe \code{bgcol} here~~
}
  \item{addgridlines}{
%%     ~~Describe \code{addgridlines} here~~
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
function (x, y, fgcol = "plum3", bgcol = "lightyellow", addgridlines = TRUE, 
    ...) 
{
    dat = data.frame(x = as.factor(x), y)
    plot(dat, axes = FALSE, xlab = NULL, ylab = NULL)
    tmp = par()$usr
    rect(tmp[1], tmp[3], tmp[2], tmp[4], col = bgcol)
    if (addgridlines) {
        ylimits = par()$usr[c(3, 4)]
        yrange = diff(ylimits)
        if (yrange > 2) {
            yscale = log(yrange, 10) + 0.15
        }
        else {
            yscale = log(yrange, 10) - 0.15
        }
        yexp = round(yscale) - 1
        ystep = 10^yexp
        if (yrange > 2) {
            ybot = trunc(ylimits[1]/ystep) * ystep - ystep
            ytop = (1 + trunc(ylimits[2]/ystep)) * ystep
        }
        else {
            ybot = trunc(ylimits[1]) - 1
            ytop = trunc(ylimits[2]) + 1
        }
        if (abs(ystep) > getOption("ts.eps")) {
            ysegs = seq(ybot, ytop, ystep)
            abline(h = ysegs, lty = 2, col = "grey75")
        }
    }
    plot(dat, add = TRUE, col = fgcol, ...)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
