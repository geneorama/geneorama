\name{clipdir}
\alias{clipdir}

\title{Copy setwd(<current working directory>) to clipboard}

\description{
In the days before R Studio's elegant directory management, this was useful
when opening new instances of R and quickly navigating to the same working
directory as an existing instance, or for saving the current wd in a script 
after manually navigating there.
}

\usage{clipdir()}

\details{
Only works in Windows!
}

\value{
Modifies system clipboard (Windows only)
}

\author{Gene Leynes}

\examples{
require(geneorama)
# clipdir()
}
