\name{dftab}
\alias{dftab}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
dftab
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
dftab(x, total = TRUE, sort = TRUE, debug = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{total}{
%%     ~~Describe \code{total} here~~
}
  \item{sort}{
%%     ~~Describe \code{sort} here~~
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
function (x, total = TRUE, sort = TRUE, debug = FALSE) 
{
    if (debug) 
        browser()
    df = table(x, useNA = "ifany")
    if (sort) 
        df = df[order(df)]
    if (!sort) 
        df = df[unique(x)]
    names(df)[is.na(names(df))] = "NA"
    df = data.frame(count = df)
    if (total) 
        df = rbind(df, TOTAL = sum(df))
    return(df)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
