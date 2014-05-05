\name{loadinstall_libraries}
\alias{loadinstall_libraries}

\title{Load packages, install from CRAN if missing}

\description{
Attempt to load a list of libraries, and install them if missing
}

\usage{
loadinstall_libraries(required_packages = c(), myrepos = "http://cran.rstudio.com/")
}

\arguments{
  \item{required_packages}{A character vector of libraries required.}
  \item{myrepos}{An optional repository argument.}
}

\details{
Call this function to load a vector of required packages that are
on CRAN. It will try to load the packages, and intall them if they
are missing.
}

\value{
}

\references{
}
\author{Gene Leynes}

\note{
To be a good citizen you really ought to change the repository to match something 
close to you.  You can get a list of repositories here: \link[http://cran.r-project.org/mirrors.html]{http://cran.r-project.org/mirrors.html}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}

\examples{
    require(geneorama)
    required_packages <- c("ggplot2", "data.table")
    loadinstall_libraries("required_packages")
}

