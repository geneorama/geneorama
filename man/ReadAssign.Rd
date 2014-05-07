\name{ReadAssign}

\alias{ReadAssign}

\title{Read Rds files into the global environment}

\description{
Read an Rds file and assign the value to the global environment with a
the name implied from the filename
}

\usage{
ReadAssign(x, assignGlobal = TRUE)
}

\arguments{
  \item{x}{The filename to be read}
  \item{assignGlobal}{If TRUE (default) parse the file name and assign the 
                      object to \code{.GlobalEnv} and return the name of the 
                      object that was read into memory. If FALSE return the 
                      object itself.}
}

\details{
}

\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}

\references{}

\author{Gene Leynes}

\note{}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}

\examples{
require(geneorama)

MyExampleData <- data.frame(x=letters, y=rnorm(length(letters)))
saveRDS(MyExampleData, file="MyExampleData.Rds")
rm(MyExampleData)
ReadAssign("MyExampleData.Rds")
CopyOfMyExampleData <- ReadAssign("MyExampleData.Rds", FALSE)
ls()
unlink("MyExampleData.Rds"); rm(MyExampleData, CopyOfMyExampleData)  ## Clean up
}
