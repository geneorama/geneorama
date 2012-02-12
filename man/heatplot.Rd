\name{heatplot}
\alias{heatplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
heatplot
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
heatplot(x, y, z, bgcol = "#777044", coltype = "heat", ccex = 1.5, circles = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
}
  \item{z}{
%%     ~~Describe \code{z} here~~
}
  \item{bgcol}{
%%     ~~Describe \code{bgcol} here~~
}
  \item{coltype}{
%%     ~~Describe \code{coltype} here~~
}
  \item{ccex}{
%%     ~~Describe \code{ccex} here~~
}
  \item{circles}{
%%     ~~Describe \code{circles} here~~
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
function (x, y, z, bgcol = "#777044", coltype = "heat", ccex = 1.5, 
    circles = TRUE, ...) 
{
    layout(matrix(c(1, 2, 3), nc = 3), widths = c(7, 1, 0.5))
    ColFormula1 = paste(coltype, ".colors(length(z))", sep = "")
    ccols = eval(parse(text = ColFormula1))
    bgfun = function() {
        tmp = par("usr")
        rect(tmp[1], tmp[3], tmp[2], tmp[4], col = bgcol)
        ylimits = par()$usr[c(3, 4)]
        abline(h = pretty(ylimits, 10), lty = 2, col = "black")
    }
    scale = function(x) {
        (x - min(x))/diff(range(x))
    }
    xname = deparse(substitute(x))
    yname = deparse(substitute(y))
    zname = deparse(substitute(z))
    plot(x, y, pch = 16, col = ccols[rank(z)], panel.first = bgfun(), 
        xlab = xname, ylab = yname, cex = ccex, ...)
    if (circles) {
        points(x, y, cex = ccex)
    }
    zlim = range(z, finite = TRUE)
    lvs = pretty(zlim, 20)
    plot.new()
    mtext(paste("legend for \"", zname, "\" values", sep = ""), 
        side = 2)
    plot.window(xlim = c(0, 1), ylim = range(lvs), xaxs = "i", 
        yaxs = "i")
    points(1, 1, cex = 5)
    ColFormula2 = paste(coltype, ".colors(length(lvs)-1)", sep = "")
    rect(0.1, lvs[-length(lvs)], 1, lvs[-1], col = eval(parse(text = ColFormula2)))
    axis(4)
    layout(c(1))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
