\name{loader}
\alias{loader}
\alias{saver}

\title{
Functions to load and save single R objects (DEPRICATED)
}
\description{
Depricated - Use readRDS
}

\usage{
loader(x, xPath = ".")
saver(x, override = FALSE) 
}

\arguments{
  \item{x}{name (or intended name) of object to be saved or loaded}
  \item{xPath}{location of file (was "Outputs/" in original version)}
  \item{override}{save over file if it already exists}
}

\details{
Loads using load, but reads in only the first object in the environment.

These basically assume that you're saving only a single object in an Rdata file,
but can be more effectively accomplished with calls to saveRDS and loadRDS.
}

\value{
Any R object
}

\author{Gene Leynes}

\note{DEPRICATED}

\seealso{
\code{\link{readRDS}}
}

\examples{
# set.seed(10)
# df <- data.frame(col1 = sample(c(rep(NA, 5), rpois(25, 7))),
#                  col2 = sample(letters[1:5], replace=TRUE),
#                  col3 = sample(letters[1:5], replace=TRUE))

## This will create a folder called "Outputs" if you don't already have one
## and attempt to save df to "Outputs", if df doesn't already exist
# dir.create("Output")
# saver("df")
# saver("df")

## Remove df, then reload it
# rm(df)
# df <- loader("df.RData", "Outputs")

## Remove folder "Output"
# unlink("Output")

## Better: 
# saveRDS(df, "df.Rds")
# anything_you_want <- readRDS("df.Rds")


}
