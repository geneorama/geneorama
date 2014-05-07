\name{addbg}
\alias{addbg}

\title{Add a background to plots after they have been plotted}

\description{
For default plots this function adds a basic background by adding a transparent 
rectangle over the plot region.
}

\usage{
addbg(color = heat.colors(40, alpha = 0.15)[30], 
      linecolor = "grey75", 
      addgridlines = TRUE)
}

\arguments{
  \item{color}{Background color, default is a yellow from heat.colors which 
               happens to look reasonable when alpha is applied.
}
  \item{linecolor}{The linecolor for the (optional) grid lines, the default is 
                   grey75}
  \item{addgridlines}{Default is TRUE, adds gridlines to the plot}
}

\details{
This adds a box over the plot area to create the illusion of a background. To truly add a background see addbg().
}

\author{Gene Leynes}

\note{
Using bgfun() is preferred, but addbg() is useful as an ad hoc method.
}

\seealso{
\code{\link{bgfun}}
}

\examples{
require(geneorama)
plot(1:10)
addbg()
}

