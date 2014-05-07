\name{inin}
\alias{inin}

\title{Summary table for what elements are common between two data sets}

\description{
Pass in two vectors for a quick comparison of common elements.
}

\usage{
inin(x, y, debug = FALSE)
}

\arguments{
  \item{x}{One vector}
  \item{y}{Another vector}
}

\details{
Pass in two vectors for comparison. 
}

\value{
Returns a data.frame
}

\author{Gene Leynes}

\note{
See example for sample output
}

\examples{

require(geneorama)

inin(letters[1:10], letters)

## OUTPUT:
# inin.summary
# Items in letters[1:10]                              10
# Items in letters                                    26
# Items in letters[1:10] and letters                  10
# Items in letters[1:10] but not in letters           NA
# Items in letters but not in letters[1:10]           16
}

