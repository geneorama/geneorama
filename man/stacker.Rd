\name{stacker}
\alias{stacker}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
stacker
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
stacker(x, id = NULL, vars = NULL, labs = c("variable", "value"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{id}{
%%     ~~Describe \code{id} here~~
}
  \item{vars}{
%%     ~~Describe \code{vars} here~~
}
  \item{labs}{
%%     ~~Describe \code{labs} here~~
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
function (x, id = NULL, vars = NULL, labs = c("variable", "value")) 
{
    if (FALSE) {
        dat = data.frame(groups1 = as.factor(sample(letters, 
            100, replace = TRUE)), groups2 = as.factor(sample(LETTERS, 
            100, replace = TRUE)), var1 = rnorm(100), var2 = rnorm(100, 
            4, 3), var3 = rnorm(100, -4, 3), var4 = rnorm(100, 
            4, 30))
        stdat = stacker(dat, id = "groups1", vars = c("var1", 
            "var2", "var3"))
        str(stdat)
        stdat = stacker(dat, id = "groups1", vars = c("var1", 
            "var2", "varx"))
    }
    if (is.null(id) | is.null(vars)) 
        stop("Please specify ids and vars")
    if (!all(c(id, vars) \%in\% colnames(x))) {
        varsNotFound = c(id, vars)[!(c(id, vars) \%in\% colnames(x))]
        stop(paste("The following variables were not found:", 
            varsNotFound))
    }
    xx = x[, vars]
    xid = data.frame(x[, id])
    temp1 = rep(names(xx), each = nrow(x))
    temp2 = as.vector(apply(xx, 2, "["))
    if (any(is.na(id))) 
        return(temp2)
    rownames(x) = NULL
    ret = data.frame(variable = temp1, value = temp2)
    for (i in seq(ncol(xid))) {
        j = ncol(xid) - i + 1
        if (class(xid[, j]) == "yearmon") {
            xid[, j] = as.character(xid[, j])
            ret = cbind(xid[, j], ret)
            ret[, i] = as.yearmon(ret[, i], "\%b\%Y")
        }
        else {
            ret = cbind(xid[, j], ret)
        }
    }
    if (is.character(id)) {
        names(ret) = c(id, labs)
    }
    else {
        names(ret) = c(names(x[, id]), labs)
    }
    return(ret)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
