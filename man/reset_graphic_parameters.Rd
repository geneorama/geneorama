\name{reset_graphic_parameters}
\alias{reset_graphic_parameters}

\title{Reset par() to default}

\description{
Opens a new graph window which essentially resets the par() back to the default
values. Note, this will make empty png or pdf files when called from the 
command line.
}

\usage{
    reset_graphic_parameters()
}

\details{
%%  ~~ If necessary, more details than the description above ~~
}

\value{}

\references{}

\author{Gene Leynes}

\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{}

\examples{

require(geneorama)

op <- par(mfrow=c(1,2))
op <- par(mfrow=c(2,2))  ## Whoops, I just overwrote op with a "non-default" par
plot(lm(1:10~rnorm(10)))


par(op)  ## This won't go back to default....
plot(1:10)

## This will reset the par, with a warning
reset_graphic_parameters()
plot(1:10)


