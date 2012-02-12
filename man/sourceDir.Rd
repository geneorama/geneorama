\name{sourceDir}
\alias{sourceDir}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
sourceDir
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
sourceDir(path, trace = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{path}{
%%     ~~Describe \code{path} here~~
}
  \item{trace}{
%%     ~~Describe \code{trace} here~~
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
function (path, trace = TRUE, ...) 
{
    for (nm in list.files(path, pattern = "\\.[Rr]$")) {
        if (trace) 
            cat(nm, ":")
        source(file.path(path, nm), ...)
        if (trace) 
            cat("\n")
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
