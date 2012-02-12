\name{makegm}
\alias{makegm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
makegm
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
makegm(mu = 0.05, sigma = 0.2, dt = 1, T = 10, sims = 10000)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mu}{
%%     ~~Describe \code{mu} here~~
}
  \item{sigma}{
%%     ~~Describe \code{sigma} here~~
}
  \item{dt}{
%%     ~~Describe \code{dt} here~~
}
  \item{T}{
%%     ~~Describe \code{T} here~~
}
  \item{sims}{
%%     ~~Describe \code{sims} here~~
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
function (mu = 0.05, sigma = 0.2, dt = 1, T = 10, sims = 10000) 
{
    timesteps = T/dt
    phi = matrix(rnorm(timesteps * sims), nrow = sims, ncol = timesteps)
    x = (mu - sigma * sigma/2) * dt + sigma * phi * sqrt(dt)
    for (i in 1:nrow(x)) x[i, ] = cumsum(x[i, ])
    s = exp(x)
    attr(s, "mu") = mu
    attr(s, "sigma") = sigma
    attr(s, "dt") = dt
    attr(s, "T") = T
    attr(s, "sims") = sims
    return(s)
    if (FALSE) {
        setwd("J:/frm_group/MStarFundResearch/R_Milliman")
        source("Functions/Function_makegm.R")
        x = makegm(mu = 0.05, sigma = 0.2, dt = 1, T = 10, sims = 1e+06)
        mean(pmax(1.1 - x[, 10], 0)) * exp(-10 * 0.05)
        mean(pmax(x[, 10] - 1.1, 0)) * exp(-10 * 0.05)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
