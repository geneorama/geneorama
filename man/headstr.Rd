\name{headstr}

\alias{headstr}

\title{shorter version of "str"}

\description{
Shows the structure of just the first 25 (by default) columns of a data.frame.
Useful when dealing with giant data sets that have many columns.
}

\usage{
headstr(x, nrows = 5, ncols = 25)
}

\arguments{
  \item{x}{data.frame or data.table}
  \item{nrows}{Number of rows to show}
  \item{ncols}{Number of columns to show}
}

\details{
Trims the data.frame or data.table to show a smaller subset of the data in 
the structure. Does not modify the object or return a value.

Although the str() result is not correct for the entire data set, headstr does
report the total columns and list the first 25 (by default) column names.
}

\value{
str()
}

\author{Gene Leynes}

\note{
This could also be accomplished using the arguments of str.
}

\seealso{
\code{\link{str}}
}

\examples{
df <- matrix(NA, nrow=1e4, ncol=1e3)
df <- data.frame(df)
headstr(df)

# Row Names: (5 of 10000 rows shown) 
# [1] "1" "2" "3" "4" "5"
# 
# Column Names: (25 of 1000 columns shown)
#  [1] "X1"  "X2"  "X3"  "X4"  "X5"  "X6"  "X7"  "X8"  "X9"  "X10" "X11" "X12" "X13" "X14" "X15" "X16" "X17" "X18" "X19" "X20"
# [21] "X21" "X22" "X23" "X24" "X25"
# 
# The structure of the first 25 of 1000 Columns:
# 
# 'data.frame':    10000 obs. of  25 variables:
#  $ X1 : logi  NA NA NA NA NA NA ...
#  $ X2 : logi  NA NA NA NA NA NA ...
#  $ X3 : logi  NA NA NA NA NA NA ...
#  $ X4 : logi  NA NA NA NA NA NA ...
#  $ X5 : logi  NA NA NA NA NA NA ...
#  $ X6 : logi  NA NA NA NA NA NA ...
#  $ X7 : logi  NA NA NA NA NA NA ...
#  $ X8 : logi  NA NA NA NA NA NA ...
#  $ X9 : logi  NA NA NA NA NA NA ...
#  $ X10: logi  NA NA NA NA NA NA ...
#  $ X11: logi  NA NA NA NA NA NA ...
#  $ X12: logi  NA NA NA NA NA NA ...
#  $ X13: logi  NA NA NA NA NA NA ...
#  $ X14: logi  NA NA NA NA NA NA ...
#  $ X15: logi  NA NA NA NA NA NA ...
#  $ X16: logi  NA NA NA NA NA NA ...
#  $ X17: logi  NA NA NA NA NA NA ...
#  $ X18: logi  NA NA NA NA NA NA ...
#  $ X19: logi  NA NA NA NA NA NA ...
#  $ X20: logi  NA NA NA NA NA NA ...
#  $ X21: logi  NA NA NA NA NA NA ...
#  $ X22: logi  NA NA NA NA NA NA ...
#  $ X23: logi  NA NA NA NA NA NA ...
#  $ X24: logi  NA NA NA NA NA NA ...
#  $ X25: logi  NA NA NA NA NA NA ...
}