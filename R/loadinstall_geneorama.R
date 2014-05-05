##
## Load / Install the Geneorama package
##
## 2014-03-31   SJR   Extracted this function from 00_Initialize.R
## 2014-05-05   GWL   Adding function to geneorama package
##


##
## Usage: Call this function to load the geneorama package, or install geneorama
##        from geneorama.com if it is not available.
##


loadinstall_geneorama <- function(){
    
    ## Try to load geneorama with "require"
    if(!require(geneorama, quietly=TRUE)){
        ## if "require" fails, then install geneorama
        
        ## Packages installed on this computer
        installed_pacakges =  .packages(all.available = TRUE)
        
        if(!'geneorama' %in% installed_pacakges){
            ## Get webfile and unzip to a temp directory
            webfile = 'http://geneorama.com/code/geneorama_1.1.tar.gz'
            tmp = tempdir()
            tmpfile = file.path(tmp, basename(webfile))
            download.file(webfile, tmpfile)
            install.packages(tmpfile, type = "source", repos = NULL)
            unlink(tmpfile)
            unlink(tmp)
        }
        library(geneorama)
    }
}


