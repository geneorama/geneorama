\name{detach_nonstandard_packages}
\alias{detach_nonstandard_packages}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Detach any non-standard packages from the search path
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
detach_nonstandard_packages(standard_packages = c("stats", "graphics", "grDevices", "utils", "datasets", "methods", "base"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{standard_packages}{All packages that you do not want detached}
}

\details{
This function allows the user to detach libraries that are not default libraries 
in R. This is used to ensure a clean and consistent environment. This is 
generally very useful for making your results reproducable when deploying, and
is also very useful when some packages mask the commands of other packages; 
you can choose the order in which non-standard packages are attached.

The choices for "standard" packages reflect what is standard in the current in
R version 3.0, but this could be different in previous or future versions.
Remember that you generally need some packages attached for R to funtion 
properly, so don't detach base for example.

It may also make sense to keep specific packages attached if they are difficult
to reload, or if they are needed within an IDE. This function appears to work 
with current versions of R Studio.
}

\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}

\references{}

\author{Gene Leynes}

\note{
See example initialization files in /doc for further usage examples.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
  \code{\link[search]{search}}
}
\examples{

## List current search path
# search()

## NOT RUN!

## This will detach packages from your current namespace, which 
## may be very inconvenient.


## Detach everything but the standard pacakges and rJava
# require(rJava)
# detach_nonstandard_packages(c("stats", "graphics", "grDevices", 
#                               "utils", "datasets", "methods", "base", 
#                               "rJava"))
## List current search path
# search()

## Detach everything but the standard pacakges
# detach_nonstandard_packages()
## List current search path
# search()

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
