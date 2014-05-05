##------------------------------------------------------------------------------
## INITIALIZE
##------------------------------------------------------------------------------

## Remove all objects; perform garbage collection
rm(list=ls()) ; gc(reset=TRUE)

## Load environment with current functions created in global initialization step
load('environment.RData')

## Detach non standard packages
detach_nonstandard_packages()

## load geneorama
loadinstall_geneorama()
loadinstall_libraries(required_packages)



