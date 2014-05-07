\name{stacker}

\alias{stacker}

\title{
Reshape your data in long format.
}

\description{
This is a shortcut to reshape long.
}
\usage{
stacker(x, id = NULL, vars = NULL, labs = c("variable", "value"))
}

\arguments{
  \item{x}{data to reshape}
  \item{id}{character name of column to repeat for each variable}
  \item{vars}{column names to stack (append to each other)}
  \item{labs}{names for the result}
}

\details{
This is another way to reshape data, but there are better ways to accomplish 
this task.
}

\value{
\code{data.frame}
}

\author{Gene Leynes}

\note{
Again, there are better ways to do this.
}


\seealso{
\code{\link{reshape}}
}
\examples{

require(geneorama)

set.seed(10)
dat <- data.frame(
    groups1 = as.factor(sample(letters,100, replace=TRUE)),
    groups2 = as.factor(sample(LETTERS,100, replace=TRUE)),
    var1 = rnorm(100),
    var2 = rnorm(100,4,3),
    var3 = rnorm(100,-4,3),
    var4 = rnorm(100,4,30))
stdat <- stacker(dat, id='groups1', vars=c('var1', 'var2', 'var3'))
str(stdat)

# 'data.frame':    300 obs. of  3 variables:
#  $ groups1 : Factor w/ 23 levels "a","b","c","e",..: 12 7 10 17 3 5 7 7 ...
#  $ variable: Factor w/ 3 levels "var1","var2",..: 1 1 1 1 1 1 1 1 1 1 ...
#  $ value   : num  -0.762 0.419 -1.04 0.712 -0.633 ...

}


