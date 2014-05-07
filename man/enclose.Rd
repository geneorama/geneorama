\name{enclose}

\alias{enclose}


\title{
Create the text of the command that would make a data object
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
enclose(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Works best if x is a vector.}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Text that would roughly evaluate to the object.
}

\author{Gene Leynes}

\note{
This is a bad version of deparse before I knew about deparse... but it's still
occasionally useful, especially when combined with \code{\link{clipper}}.
}

\seealso{
\code{\link{deparse}}
}
\examples{

enclose(rnorm(10))
# "c('0.018130268180236', '-1.23898951831708', '-0.198405479640197', 
# '0.211568161388036', '-0.0227780654230781', '1.08823221976137', 
# '-0.102064404487439', '-1.55052536125024', '2.51492182878254', 
# '0.434675924710012')"
}
