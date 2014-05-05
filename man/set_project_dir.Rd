\name{set_project_dir}

\alias{set_project_dir}

\title{Navigate to \code{..} until \code{project_name} is found}

\description{
Navigate up until the project directory is found.
}

\usage{
set_project_dir(project_name)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{project_name}{The name of the root folder of the current project, e.g.
                      \code{geneorama}}
}

\details{
This is most useful when using an Rmd within a subdirectory of a project. 
Without this function the relative paths of the subdirectory would not be found.

For example suppose you have a project named MYPROJECT, a data file 
called MYPROJECT/DATA/MYDATA.Rds, and another file called 
MYPROJECT/REPORT1/REPORT.Rmd

If you step through the Rmd file you can work within MYPROJ and find the data
file by \code{readRDS("DATA/MYDATA.Rds")}

However, if you try to complie the Rmd file it won't find the data because it 
knitr will work withn the REPORT folder.

To remedy this you can use \code{set_project_dir(MYPROJECT)} within the code 
chunk that load the data. It will not affect your work if you step through the 
code manually, and it will automatically jump up a directory when you try 
to compile the Rmd file.

}

\value{}

\references{}

\author{Gene Leynes}

\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}

\examples{

## This is too context specific to provide an example.