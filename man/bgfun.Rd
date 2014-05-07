\name{bgfun}
\alias{bgfun}

\title{
Add a background to a plot
}

\description{
Adds a non-transparent background to plots, with gridlines for more professional
looking plots that are easier to read. The color can be customized, the 
default is the built in color "honeydew2".
}

\usage{
bgfun(color = "honeydew2", 
      linecolor = "grey45", 
      addgridlines = TRUE)
}

\arguments{
  \item{color}{Color value passed to \code{rect}}
  \item{linecolor}{Color used for gridlines}
  \item{addgridlines}{Add gridlines? Default is TRUE}
}

\author{Gene Leynes}

\note{Uses panel.first}

\section{Warning }{
panel.first (in plot.default) is not supported in plot.formula!

See workaround below

http://r-project.markmail.org/thread/b4szqhorzynnzfhs
}

\seealso{
\code{\link{addbg}},
\code{\link{panel.first}}
}

\examples{

## Example of plot.default:
plot(rnorm(100), panel.first=bgfun())

## Example of plot.formula workaround:
df = data.frame(x = 1:100,
                y = rnorm(100))
plot(y~x, data=df, type="n")
points(y~x, data=df, panel.first=bgfun())


}
