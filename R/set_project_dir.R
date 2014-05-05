
##
## Attempt to set project directory within Rmd files
##
## 2014-03-31   SJR   Extracted this function from 00_Initialize.R
## 2014-05-05   GWL   Adding function to geneorama package
##

##
## Usage: Call this function within Rmd files if they are located higher than 
##        the project root directory. This will navigate up one directory until
##        it reaches either the root directory or "project_name"
##

set_project_dir <- function(project_name){
    while (basename(getwd()) != "project_name" &&
               basename(getwd()) != basename(normalizePath(".."))){
        setwd("..")
    }
}



