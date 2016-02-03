Geneorama package for R
==============================

The geneorama package for R is a collection of utilities written by Gene Leynes

There is help, there is more information in the DESCRIPTION file, but there are also issues.  I'm not sure how well the help is working, it's not making a proper index just yet.  However, you can query each function individually with the normal help syntax: for example `?lll` will bring up the help for `lll()`, which is an enhanced version of `ls()`.  

You should consider these functions to be beta, and subject to change. 

INSTALLATION
---------------------------------

Install from github using Hadley's package "devtools".
Within R
``` R
## Remove geneorama if it's already installed
if("geneorama" %in% installed.packages()[ , "Package"]){
   remove.packages("geneorama")
}
## Install devtools, if needed
if(!"devtools" %in% installed.packages()[ , "Package"]){
   install.packages("devtools"")
}

## Install geneorama
devtools::install_github("geneorama/geneorama")
```
Alternatively, clone the repo and build geneorama with `R CMD INSTALL`.
At the command line:
```
git clone https://github.com/geneorama/geneorama
R CMD INSTALL geneorama/
```

NEWS
---------------------------------



### Version 1.5.0 (2016-02-03)

 * Updating `loadinstall_libraries` to have "install_only" argument.
 
 * Adding `doc/upgrade_R_libraries.R` example to show how to update R packages after a fresh R installation.


#### 2015-12-23
 
 * Adding `json_to_datatable` function that converts simple json lists to table format.

#### 2015-12-18

 * Adding `nokey` a function to return a data.table without the key.

 * Added `doc/interpolation_example.R` to demonstrate simple interpolation is 2 dimensional space.

 * Added `doc/scraper.R` syntax examples for downloading folders from websites (including `wget` example).

#### 2015-11-23

 * Added `doc/fread_on_url.R` example of using `data.table::fread` on URLs.

* Updated `doc/formattable_example.Rmd` example of using formattable package, updated for recent package changes.

 * Added `doc/DiagrammeR_example.Rmd` example of creating network diagrams in markdown format.

 * Created `data.table` version of `NAsummary` function, but it was slow, so it's commented out.
 
#### 2015-10-13

 * Updated documentation template for `roxygen2` located at `doc/documentation_template.R`

#### 2015-07-27

 * Updated ggplot2 master example 

### Version 1.4.1 (2015-07-15)

 * Updated documentation to `roxygen2 (4.1.1)`

 * Added `R\convert_datatable_StringFactor`

 * Updated `R\convert_datatable_FactorString`

### Version 1.4 (2014-09-05)

Converted documentation to `roxygen2`.


### Version 1.3 (2014-06-17)

Added `data.table` functions


### Version 1.2 (2014-05-07)

Removed old functions, first "stable" version.


### Version 0.5 (2012-01-30)

Initial version

Functions include: NAsummary, 



