\name{dftab}

\alias{dftab}
%- Also NEED an '\alias' for EACH other topic documented here.

\title{Enhanced table}

\description{
Just like \code{table}, except that it's a \code{data.frame}, and it's sorted, 
and there's a total
}

\usage{
dftab(x, total = TRUE, sort = TRUE)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{item passed to table, usually a vector}
  \item{total}{Include TOTAL count? Default == TRUE}
  \item{sort}{Sort output? Default == TRUE}
}
\details{
Quite frequently it's easier to deal with a data frame object than a table.

Note, that sorting numbers will treat the numbers as text.
}

\value{
Count of items in x returned as a \code{data.frame}.
}

\author{Gene Leynes}

\seealso{
\code{\link{table}}
}

\examples{

set.seed(10)
df <- data.frame(col1 = sample(c(rep(NA, 5), rpois(25, 7))),
                 col2 = sample(letters[1:5], replace=TRUE),
                 col3 = sample(letters[1:5], replace=TRUE))
dftab(df$col1)

#       count
# 3         1
# 9         1
# 4         2
# 10        2
# 7         3
# 5         4
# 8         4
# NA        5
# 6         8
# TOTAL    30

}



