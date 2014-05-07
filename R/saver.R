saver <- function(x, override=FALSE){
    fname <- paste('Output/',x,'.RData',sep='')
    if(file.exists(fname) & !override){
        warning('A file already exists in ',fname,'\n')
        #cat('A file already exists in ',fname,'\n')
    }else{
        if(as.name(x)=='x'){
            rm(x)
            save(x,file=fname)
        }else{
            eval(substitute(save(variable,file=fname),
                            list(variable = as.name(x))
            ))
        }
    }
}
