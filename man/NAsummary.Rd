\name{NAsummary}
\alias{NAsummary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Summarize NA and Unique Values
}
\description{
For a data frame, data.table, or matrix this function creates a summary of the count and percentage of NA's and unique values for each column.}

\usage{
NAsummary(df, include.nan = FALSE)
}

\arguments{
  \item{df}{A data frame or data table}
  \item{include.nan}{Also include NAN in the NA portion of the summary}
}

\details{This simple summary can be useful for understanding how many unique values or missing values are contained in a data.frame / data.table.}

\value{Returns a data.frame}


\author{Gene Leynes}

\note{}

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
require(geneorama)
set.seed(100)
df <- data.frame(col1 = sample(c(rep(NA, 5), rpois(25, 7))),
                 col2 = sample(letters[1:5], replace=TRUE),
                 col3 = sample(letters[1:5], replace=TRUE))
NAsummary(df)
}
