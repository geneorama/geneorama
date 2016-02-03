





## Might as well update the packages that were _just_ installed...
update.packages()

## We'll need dev tools and geneorama
install.packages("devtools")
devtools::install_github("geneorama/geneorama")
library(geneorama)

## Check geneorama version
installed.packages()["geneorama","Version"]
installed.packages()["geneorama","Version"] > "1.4"
installed.packages()["geneorama","Version"] > "1.5"

## Get previous libraries
prev <- list.files("C:/Program Files/R/R-3.2.2/library/")

detach_nonstandard_packages

## Get libraries to be installed
needed <- prev[!prev %in% list.files("C:/Program Files/R/R-3.2.3/library/")]

## Install each library
for(pkg in needed){
	print(pkg)
	loadinstall_libraries(pkg, install_only = T)
}


