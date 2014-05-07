\name{getFormals}

\alias{getFormals}

\title{
getFormals
}

\description{
Get the formal aruguments of a function.
}

\usage{
getFormals(x)
}

\arguments{
  \item{x}{function}
}

\details{
Cleans and returns the function's arguments
}

\value{
Character vector
}

\author{Gene Leynes}

\seealso{
\code{\link{formals}}
}
\examples{
getFormals(lm)
# [1] "(formula, data, subset, weights, na.action, method=qr, model=TRUE, 
# x=FALSE, y=FALSE, qr=TRUE, singular.ok=TRUE, contrasts=NULL, offset, ...)"
}
