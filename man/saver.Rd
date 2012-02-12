\name{saver}
\alias{saver}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
saver
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
saver(x, override = FALSE, debug = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{override}{
%%     ~~Describe \code{override} here~~
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
function (x, override = FALSE, debug = FALSE) 
{
    if (debug) 
        browser()
    fname = paste("Output/", x, ".RData", sep = "")
    if (file.exists(fname) & !override) {
        warning("A file already exists in ", fname, "\n")
    }
    else {
        if (as.name(x) == "x") {
            rm(x)
            save(x, file = fname)
        }
        else {
            eval(substitute(save(variable, file = fname), list(variable = as.name(x))))
        }
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
