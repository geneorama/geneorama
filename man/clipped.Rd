\name{clipped}
\alias{clipped}

\title{
clipped
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
clipped(lowercase = TRUE, removedot = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lowercase}{
%%     ~~Describe \code{lowercase} here~~
}
  \item{removedot}{
%%     ~~Describe \code{removedot} here~~
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
function (lowercase = TRUE, removedot = TRUE) 
{
    x = read.delim("clipboard")
    if (lowercase) 
        colnames(x) = tolower(colnames(x))
    if (removedot) 
        colnames(x) = gsub("\\.", "", colnames(x))
    return(x)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
