

if(! 'devtools' %in% unname(installed.packages()[ , 'Package'])){
    install.packages("devtools")
}
library(devtools)
install_github("geneorama/geneorama")



if(FALSE){
    ## This is not the old bad way to do things.
    
    ## Remove old geneorama, make sure that you can download it again!
    remove.packages('geneorama')
    
    ## Load the function to install geneorama
    source('http://geneorama.com/code/loadinstall_geneorama_1.3.R')
    
    ## Install geneorama
    loadinstall_geneorama()
    
    ## Remove the function to install geneorama
    rm(loadinstall_geneorama)
    
    ## Load the new geneorama
    library(geneorama)
    
}


