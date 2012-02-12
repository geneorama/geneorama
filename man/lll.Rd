\name{lll}
\alias{lll}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
lll
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
lll(sortBy = c("name", "class", "size")[1], digits = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sortBy}{
%%     ~~Describe \code{sortBy} here~~
}
  \item{digits}{
%%     ~~Describe \code{digits} here~~
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
function (sortBy = c("name", "class", "size")[1], digits = 0) 
{
    objClass = function(object.name, pos) {
        object = get(object.name, pos = pos)
        class = class(object)[1]
        return(class)
    }
    objDim = function(object.name, pos) {
        obj = get(object.name, pos = pos)
        objdim = paste(dim(obj), collapse = " x ")
        if (objdim == "") {
            objdim = length(obj)
        }
        return(objdim)
    }
    objSize = function(objName, pos) {
        obj = get(objName, pos = pos)
        size = try(unclass(object.size(obj)), silent = TRUE)
        if (class(size) == "try-error") {
            size = 0
        }
        return(size)
    }
    pos = 1
    items = ls(pos)
    if (length(items) == 0) {
        ret = data.frame()
    }
    else {
        ret = data.frame(Class = sapply(items, objClass, pos = pos), 
            KB = round(sapply(items, objSize, pos = pos)/1024, 
                digits), Dims = sapply(items, objDim, pos = pos))
        row.names(ret) = items
        ret = ret[ret$Class != "function", ]
    }
    if (nrow(ret) == 0) {
        ret = data.frame()
    }
    ret = switch(sortBy, name = ret, class = ret[order(ret$Class), 
        ], size = ret[rev(order(ret$KB)), ])
    return(ret)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
