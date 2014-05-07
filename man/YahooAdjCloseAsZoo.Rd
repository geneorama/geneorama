\name{YahooAdjCloseAsZoo}
\alias{YahooAdjCloseAsZoo}
\alias{YahooAdjCloseAsZooWeekly}

\title{
YahooAdjCloseAsZoo
}

\description{
Downloads yahoo stock data and puts it into a zoo object
}

\usage{
YahooAdjCloseAsZoo(x, freq = "monthly", begin = "2000-01-01", end = Sys.timeDate())
YahooAdjCloseAsZooWeekly(symbols, ...) 
}

\arguments{
  \item{x, symbols}{Symbols to retrieve from Yahoo}
  \item{freq}{Frequency either "weekly" or "monthly"}
  \item{begin}{Start date in YYYY-MM-DD character format}
  \item{end}{End date in YYYY-MM-DD character format}
  \item{...}{Additional arguments passed to YahooAdjCloseAsZoo}
}

\details{
Basically a fancy wrapper for \code{yahooImport}.  It puts the data into a zoo
object for easy printing. 

This is poorly written, I hope to fix it one day. Not sure why some of the code 
is even in there.
}

\value{
zoo object
}

\references{
fImport
}

\author{Gene Leynes}

\note{
Not currently working? May have problem with fImport.
}

\seealso{
\code{\link{yahooImport}}
}

\examples{

## NOT RUN:
## YahooAdjCloseAsZoo(c("goog, m"), begin="2014-01-01", end="2014-04-01")
## YahooAdjCloseAsZoo("goog", begin="2014-01-01", end="2014-04-01")
}
