\name{plotRunningSd}
\alias{plotRunningSd}

\title{Plot standard deviation lines using \code{running}}

\description{Add +/- 1 stdev to a line plot}

\usage{plotRunningSd(dat)}

\arguments{
  \item{dat}{Must be a vector}
}
\details{Very simple way to add standard deviation lines to a plot.}

\value{Plot output}

\references{
relies on the gtools running
}
\author{Gene Leynes}

\note{Needs error checking added for non vector input.}

\examples{
 plotRunningSd(rnorm(100))
}

