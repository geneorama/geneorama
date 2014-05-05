\name{addbg}
\alias{addbg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
addbg
}
\description{
For default plots this function adds a basic background by adding a transparent rectangle over the plot region.
}
\usage{
addbg(color = heat.colors(40, alpha = 0.15)[30], 
      linecolor = "grey75", 
      addgridlines = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{color}{
%%     ~~Describe \code{color} here~~
Background color, default is a yellow from heat.colors which happens to look reasonable when alpha is applied.
}
  \item{linecolor}{
%%     ~~Describe \code{linecolor} here~~
The linecolor for the (optional) grid lines, the default is grey75
}
  \item{addgridlines}{
%%     ~~Describe \code{addgridlines} here~~
Add gridlines by default
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
This adds a box over the plot area to create the illusion of a background. To truly add a background see addbg().
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
Gene Leynes
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

require(geneorama)
plot(1:10)
addbg()

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
