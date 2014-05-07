\name{wtf}
\alias{wtf}

\title{
Write Temp File (CSV Format)
}

\description{
Write a temp file containing x, and open it using the system application for 
csv files. In Windows, it's useful to make sure Excel is registered to open
Excel CSV files.
}

\usage{
wtf(x)
}

\arguments{
  \item{x}{\code{data.frame} or \code{data.table}}
}

\details{
Writes and opens a temp file, what else would \code{wtf} mean?
}

\value{
CSV File
}

\author{Gene Leynes}

\note{
Works most seamlessly in windows. It will generate a file name that matches 
the variable name, unless that name is already taken, in which case it generates
a temp name.
}


\seealso{
\code{\link{write.table}}
}

\examples{
# df <- data.frame(
#     area = unname(state.x77[,'Area']),
#     frost = unname(state.x77[,'Frost']),
#     comments = "Ok for a visit, but don't want to live there",
#     challengeComments = c('"', '""'))
# row.names(df) <- state.name
# df <- df[1:10, ]
# df['California', 'comments'] = "Would like to live here"
# wtf(df)
# 
# mat <- matrix(rnorm(100), 10)
# wtf(mat)
# 
# v <- 1:10
# wtf(v)
}
