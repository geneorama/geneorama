Geneorama package for R
==============================

The geneorama package for R is a collection of utilities written by Gene Leynes

There is help, there is more information in the DESCRIPTION file, but there are also issues.  I'm not sure how well the help is working, it's not making a proper index just yet.  However, you can query each function individually with the normal help syntax: for example `?lll` will bring up the help for `lll()`, which is an enhanced version of `ls()`.  

You should consider these functions to be beta, and subject to change. 

How to install geneorama
---------------------------------


Method 1 (The easy way)

Install from github using Hadley's package "devtools".
Do this all within R
``` R
## Remove geneorama if it's already installed
if("geneorama" %in% installed.packages()[ , "Package"]){
   remove.packages("geneorama")
}
## Install devtools, if needed
install.packages('devtools')

## Install geneorama
devtools::install_github("geneorama/geneorama")
```



Method 2 (The slightly harder)
Clone the geneorama repo at the command line
Use R Studio to open the project and then build geneorama.
(you basically click on the "build" command", you may have to install roxygen2)

Method 3 (Hardest)
Clone the geneorama repo at the command line
Use R (from the command line) to build geneorama


