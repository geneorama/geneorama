\name{tic}
\alias{tic}
\alias{toc}

\title{
Matlab type functions for tracking time
}

\description{
Call \code{tick} at the top of a script to start the timer, and \code{toc} 
later on to print the elapsed times.
}

\usage{
tic()
toc()
}

\details{
tic and toc are convenience functions to print elapsed time.

\code{tic} and \code{toc} use \code{proc.time}, which is depricated, use
\code{system.time} instead (although \code{proc.time} is a lot easier for 
this use case).
}

\value{
NULL
}


\author{Gene Leynes}

\note{
See details.
}

\seealso{
\code{\link{system.time}},
\code{\link{proc.time}},
}

\examples{
tic()
print('hi there')
toc()
invisible(rnorm(1e7))
toc()
invisible(rnorm(1e7))
toc()
print('good bye')
toc()
}
