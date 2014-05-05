\name{loadinstall_geneorama}
\alias{loadinstall_geneorama}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Load or Install and Load the geneorama library}

\description{A call to this function will load the geneorama package, or 
download, install, and load the geneorama library.}

\usage{loadinstall_geneorama()}

\details{
Geneorama is a package that contains a collection of general utilities.
Geneorama is a library that is not currently on CRAN (as of 2014-05-05). This 
function will download and install the library from geneorama.com

Of course you don't need this function after this library is called.

}

\value{}

\references{}

\author{Gene Leynes}

\note{
If geneorama is in \code{.packages(all.available = TRUE)} Then 
\code{library(geneorama)} is called.  
Otherwise, a file is downloaded to a temp directory, it is unzipped, and 
\code{install.packages(tmpfile, type = "source", repos = NULL)} is called on 
the temp file.  The temp file is subsequently deleted.}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[loadinstall_libraries]{loadinstall_libraries}}
}

\examples{

## NOT RUN!!
## You may not wish to have geneorama installed, so this is commented out.
# loadinstall_geneorama()

## Example for running if you can only access this documentation
## NOTE: You may wish to check for a more recent package in 
## http://geneorama.com/code/
##
# loadinstall_geneorama <- function(){
#     
#     ## Try to load geneorama with "require"
#     if(!require(geneorama, quietly=TRUE)){
#         ## if "require" fails, then install geneorama
#         
#         ## Packages installed on this computer
#         installed_pacakges =  .packages(all.available = TRUE)
#         
#         if(!'geneorama' %in% installed_pacakges){
#             ## Get webfile and unzip to a temp directory
#             webfile = 'http://geneorama.com/code/geneorama_1.1.tar.gz'
#             tmp = tempdir()
#             tmpfile = file.path(tmp, basename(webfile))
#             download.file(webfile, tmpfile)
#             install.packages(tmpfile, type = "source", repos = NULL)
#             unlink(tmpfile)
#             unlink(tmp)
#         }
#         library(geneorama)
#     }
# }

