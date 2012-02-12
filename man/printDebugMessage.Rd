\name{printDebugMessage}
\alias{printDebugMessage}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
printDebugMessage
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
printDebugMessage(DebugMode, msg = NULL, indent = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{DebugMode}{
%%     ~~Describe \code{DebugMode} here~~
}
  \item{msg}{
%%     ~~Describe \code{msg} here~~
}
  \item{indent}{
%%     ~~Describe \code{indent} here~~
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
function (DebugMode, msg = NULL, indent = 0) 
{
    CurCallDepth = length(sys.calls())
    if (CurCallDepth == 1) {
        PreviousFunction = "TopLevel"
    }
    else {
        PreviousCall = sys.calls()[[CurCallDepth - 1]]
        PreviousFunction = as.character(PreviousCall)[1]
    }
    RepLetter = substr(gsub("[a-z]", "", PreviousFunction), 1, 
        1)
    if (RepLetter == "") 
        RepLetter = "\%"
    if (is.null(msg)) 
        msg = "START"
    msgIsStart = length(grep("[Ss][Tt][Aa][Rr][Tt]", msg)) != 
        0
    if (DebugMode & indent == 0 & msgIsStart) {
        cat("\n", paste(rep(RepLetter, 56), collapse = ""), "\n")
    }
    if (DebugMode) {
        cat(rep("\t", indent), PreviousFunction, "-", msg, "\n")
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
