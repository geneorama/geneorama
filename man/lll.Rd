\name{lll}
\alias{lll}

\title{
List objects in memory, plus detail
}

\description{
Similar to ls(), but this also lists the size of each object, and skips 
functions.
}
\usage{
lll(sortBy = c("name", "class", "size")[1], digits = 0)
}

\arguments{
  \item{sortBy}{sort by either "name", "class", or "size"}
  \item{digits}{Rounding the output}
}

\details{
Inspired by ll in the gdata package. Can be very useful for seeing what's taking
up your memory, as well as other uses.
}

\value{
\code{data.frame}
}

\references{
gdata package
}

\author{Gene Leynes}

\seealso{
\code{\link{ll}} (in gdata)
}

\examples{
lll()
}

