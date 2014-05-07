\name{clipped}
\alias{clipped}

\title{Read table from clipboard}

\description{
Read a table from the clipboard. Works well with Windows and Excel. Can also be useful for items copied from a text editor or other clipboard objects.
}
\usage{
clipped(lowercase = TRUE, removedot = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lowercase}{Set to FALSE to keep the case of column names}
  \item{removedot}{The default, TRUE, will remove any .'s from the column names
                   which usually indicates illegal characters generated from
                   a call to \code{make.names}.}
}
\details{
The clipboard is easy to access on Windows, and so this function is not 
available in Linux or Mac platforms.  This function is a glorified call to 
read.delim("clipboard"), so it only recognizes tab delimited data.}

\value{Data frame with default options.}

\author{Gene Leynes}

\note{Windows OS only.}

\seealso{
\code{\link{read.delim}}
}

\examples{
##  NOT RUN:
## Copy something in excel
## x = clipped()
}
