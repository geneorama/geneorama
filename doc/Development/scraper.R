## This script is not really used!


## Use wget instead
## wget --mirror -l3 http://depts.washington.edu/pocdata/joe/
## wget -nc -r -l3 http://depts.washington.edu/pocdata/joe/


## however there are some working examples in here




rm(list=ls())

# devtools::install_github("geneorama/geneorama")
geneorama::loadinstall_libraries(c("XML", "RCurl", "geneorama"))


dir.create('pocdata.joe')
setwd('pocdata.joe')

base_url <- 'http://depts.washington.edu/pocdata/joe/'

base_parsed <- htmlParse(getURL(base_url))
base_parsed

# cbind(xpathSApply(base_parsed, "//a", xmlAttrs),
#       xpathSApply(base_parsed, "//a", xmlValue),
#       xpathSApply(base_parsed, "//a/@href"))


folders <- xpathSApply(base_parsed, "//a", xmlValue)
folders <- folders[grep("/$",folders)]
folders

## Example of the process:
if(FALSE){
    parsed1 <- htmlParse(getURL(paste0(base_url, folders)[1]))
    items1 <- xpathSApply(parsed1, "//a", xmlAttrs)
    items1 <- items1[grep("^\\?|/pocdata/joe/", items1, invert=T)]
    items1
    paste0(paste0(base_url, folders)[[1]], items1)
    
    rm(items1, parsed1)
}

download_folder <- function(folder, info.only=FALSE){
    cur_parsed <- htmlParse(getURL(paste0(base_url, folder)[1]))
    cur_items <- xpathSApply(cur_parsed, "//a", xmlAttrs)
    cur_items <- cur_items[grep("^\\?", cur_items, invert = T)]
    cur_items <- unname(cur_items)
    ## Check to see if any of the items actually points back to the 
    ## base_url (or up the tree) by doing a grep for each item on the base url
    ## Manual way:
    # cur_items <- cur_items[grep("^\\?|/pocdata/joe/", cur_items, invert = T)]
    ## Automatic ways:
    # names(which(sapply(sapply(cur_items, grep, x=base_url), length)==0))
    cur_items <- cur_items[!sapply(paste0(cur_items, "$"), grepl, x = base_url)]
    cur_items
    
    cur_dirs <- cur_items[grep('/$', cur_items)]
    cur_items <- cur_items[grep('/$', cur_items, invert=T)]
    
    cur_download <- paste0(base_url, folder, cur_items)
    cur_destination <- paste0(folder, cur_items)
    stopifnot(length(cur_destination)==length(cur_download),
              )
    
    if(!info.only & !file.exists(folder)) dir.create(folder)
    
    for(i in 1:length(cur_download)){
        if(info.only){
            cat(cur_download[i], "-->\n", cur_destination[i], "\n\n")
        } else {
            download.file(url=cur_download[i], destfile=cur_destination[i])
        }
    }
    return(cur_dirs)
}

## How to make recursive?
# download_folder_recursively <- function(){
#     download_folder()
# }

for(f in folders){
    download_folder(f, info.only=TRUE)
}
    
download_folder(folders[1], info.only=TRUE)
download_folder(folders[2], info.only=TRUE)
download_folder(folders[2], info.only=F)
download_folder(info.only=TRUE)

    












