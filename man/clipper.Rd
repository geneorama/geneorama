\name{clipper}

\alias{clipper}

\title{clipper}

\description{Copy object to the clipboard}

\usage{
clipper(x)
}

\arguments{
  \item{x}{Usually a vector or data.frame}
}

\details{

This is only available on Windows.

This makes it very easy to copy things into Excel on windows, but it's memory 
constrained.

This is just a glorified copy to the clipboard:
write.table(x, "clipboard", sep = "\\t", col.names = TRUE, row.names = FALSE)
}

\value{ NULL }

\author{Gene Leynes}

\note{Only works for smallish objects, perfect for summary tables that you want
to drop into Excel or a text editor.}

\examples{

df <- data.frame(col1=rnorm(10), col2=letters[1:10])
clipper(df)
## Now go paste this somewhere else! Try Excel or Open Office (if you must)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
