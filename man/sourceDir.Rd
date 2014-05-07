\name{sourceDir}
\alias{sourceDir}

\title{
Source all the files in a directory
}

\description{
Source all the files in a directory and print the file names.
}

\usage{
sourceDir(path, trace = TRUE, ...)
}

\arguments{
  \item{path}{path to directory as character}
  \item{trace}{Default: TRUE; prints file names}
  \item{\dots}{Additional arguments passed to \code{source}}
}

\details{
Source each file in order.
}

\value{
NULL
}

\references{
R help for \code{source}
}

\author{Gene Leynes}

\note{No error handling.}

\seealso{
\code{\link{source}}
}

\examples{
# sourceDir("directoryName")
}

