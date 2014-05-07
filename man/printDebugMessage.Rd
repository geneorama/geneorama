\name{printDebugMessage}

\alias{printDebugMessage}

\title{
printDebugMessage
}

\description{
print debug messages from within a function
}

\usage{
printDebugMessage(DebugMode, msg = NULL, indent = 0)
}

\arguments{
  \item{DebugMode}{Boolean to indicate if you are in "debug mode" and wish
                   to print messages}
  \item{msg}{Prefix for messages}
  \item{indent}{Indent level (used internally?)}
}

\details{
Call printDebugMessages at the top of a function to print debug messages. Useful
for telling when a long, nested, group of functions fails.
}

\value{NULL}

\author{Gene Leynes}

\note{
Documentation is incomplete, it's been a while since I used this.
}

\examples{
}
