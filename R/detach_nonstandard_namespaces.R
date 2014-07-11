detach_nonstandard_namespaces <- function(
    standard_packages = c('stats', 'graphics', 'grDevices', 'utils', 'datasets', 
                          'methods', 'base'),
    standard_namespaces = c('tools', 'Rcpp', 'data.table', 'reshape2',
                            'stringr', 'plyr'),
    maxiter = 20){
    
    keepme <- unique(c(standard_packages, standard_namespaces))
    
    for(i in 1:maxiter){
        deplist <- dependencylist(standard_packages = keepme)
        if(length(deplist)==0){
            break
        } else if(all(sapply(deplist, length)==1) && 
                      all(sapply(deplist, is.na))){
            for(pkg in names(deplist)) unloadNamespace(pkg)
            break
        } else {
            mat <- list2matrix(deplist)
            unloadme <- rownames(mat)[!rownames(mat) %in% colnames(mat)]
            for(pkg in unloadme) {
                unloadNamespace(pkg)
            }
        }
    }
    if(i == 20){
        warning('max iterations reached in detach_nonstandard_namespaces')
    }
}
