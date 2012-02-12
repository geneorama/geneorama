\name{inin}
\alias{inin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
inin
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
inin(x, y, debug = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{y}{
%%     ~~Describe \code{y} here~~
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
function (x, y, debug = FALSE) 
{
    if (debug == TRUE) 
        browser()
    if (!is.null(dim(x)) | !is.null(dim(y))) {
        print("Requires vector args")
        return(NULL)
    }
    lenx = length(x)
    leny = length(y)
    tab1 = table(x \%in\% y, useNA = "ifany")
    tab2 = table(y \%in\% x, useNA = "ifany")
    xiny = tab1["TRUE"][[1]]
    xiny
    yinx = tab2["TRUE"][[1]]
    yinx
    xnotiny = tab1["FALSE"][[1]]
    xnotiny
    ynotinx = tab2["FALSE"][[1]]
    ynotinx
    xx = data.frame(`inin summary` = c(`Items in X` = lenx, `Items in Y` = leny, 
        `Items in X and Y` = xiny, `Items in X but not in Y` = xnotiny, 
        `Items in Y but not in X` = ynotinx))
    rownames(xx) = gsub("X", deparse(substitute(x)), rownames(xx))
    rownames(xx) = gsub("Y", deparse(substitute(y)), rownames(xx))
    return(xx)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
