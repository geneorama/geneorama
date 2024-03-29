% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/detach_nonstandard_packages.R
\name{detach_nonstandard_packages}
\alias{detach_nonstandard_packages}
\title{detach_nonstandard_packages - Detach any non-standard packages from
the search path}
\usage{
detach_nonstandard_packages(
  standard_packages = c("stats", "graphics", "grDevices", "utils", "datasets",
    "methods", "base", "tools", "Rcpp"),
  standard_namespaces = c("tools", "Rcpp", "data.table"),
  detach_namespaces = FALSE
)
}
\arguments{
\item{standard_packages}{Vector of packages considered to be "standard" and
not detached.  The default value is c('stats', 'graphics', 'grDevices',
'utils', 'datasets', 'methods', 'base', 'tools', 'Rcpp')
Although Rcpp isn't "standard", it can't be detached.}

\item{standard_namespaces}{Vector of standard namepaces NOT IMPLEMENTED
These are namespaces that you want to keep, if you are detaching namespaces;
i.e. (if detach_namespaces == TRUE)
The default value is c('tools', 'Rcpp', 'data.table')}

\item{detach_namespaces}{Do you want to detach name spaces? NOT IMPLEMENTED
Default value is FALSE}
}
\description{
Detaches non standard packages for a (fairly) clean initialization at
		the start of an interactive script.
}
\details{
This would be better if you could detach namespaces, but you really
		can't.  Even though the logic pretty much exists, there issues with
		unloading DLLs in Windows and similar complications in non-Windows
		systems.

		The best way to detach namespaces is to restart R, which in R Studio
		is quite easy; just select your current project again in the upper
		right hand corner of the application and you'll be back where you were
		with a clean R instance.
}
\note{
To see the full list of attached namespaces and pacakges run
		\code{sessionInfo()}.  Load some pacakges first to see a decent example,
		such as ggplot2, data.table, or caret.
}
\examples{
	\dontrun{

	##----------------------------------------------------------------------
	## Initialize a script by removing all packages and deleting all objects
	##----------------------------------------------------------------------
	library(geneorama)
	rm(list=ls())
	detach_nonstandard_packages()
	}



}
\seealso{
\code{\link[utils]{sessionInfo}}
		\code{\link[base]{loadedNamespaces}}
}
\author{
Gene Leynes and Scott Rodgers
}
