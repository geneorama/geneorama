\name{comma}
\alias{comma}

\title{
Add comma format to numbers
}

\description{
This adds some leading space and commas to a number.

There are better ways to do this, but the code does have a nice example of 
for mapply.
}

\usage{
comma(x, nDigits = 2)
}


\arguments{
  \item{x}{Number or vector of numbers}
  \item{nDigits}{Doesn't currently work... was supposed to add trailing digits.}
}


\value{
Vector of class character.
}

\author{Gene Leynes}

\note{
This function is likely to be deleted or change in the future.
}


\seealso{
\code{\link{formatC}}
}

\examples{

comma(100000)
# [1] "  100,000"

comma(100000:100010)
# [1] "  100,000" "  100,001" "  100,002" "  100,003" "  100,004" "  100,005" 
# [7] "  100,006" "  100,007" "  100,008" "  100,009" "  100,010"

}
