
##==============================================================================
## JSON EXPERIMENT
##==============================================================================

##------------------------------------------------------------------------------
## Construct URL
## Download content
## Extract as text
##------------------------------------------------------------------------------

get_content <- function(base_url, LIMIT = 25000, param=NULL){
    result <- list()
    i <- 0
    while(length(result)==0 || length(result[[length(result)]]) >= LIMIT ){
        i <- i + 1
        cat("httr get request number", i, "\n")
        url <- paste0(base_url,
                      "?$LIMIT=",
                      sprintf("%i", LIMIT),
                      "&$OFFSET=",
                      sprintf("%i", (i - 1) * LIMIT))
        if(!is.null(param)){
            url <- paste0(url, param)
        }
        result[[i]] <- httr::GET(url)
        result[[i]] <- httr::content(result[[i]])
    }
    result <- Reduce(c, result)
    return(result)
}

##------------------------------------------------------------------------------
## GET METADATA
##------------------------------------------------------------------------------

# metadataRaw <- httr::content(httr::GET("https://data.cityofchicago.org/views/me59-5fac"),
#                              as = "text")
# metadataRaw <- RJSONIO::fromJSON(metadataRaw)$columns

get_metadata <- function(base_url){
    # browser()}
    url <- gsub("/resource/", "/views/", base_url)
    metadataRaw <- httr::content(httr::GET(url),
                                 as = "text")
    metadataRaw <- RJSONIO::fromJSON(metadataRaw)$columns
    # unique(unlist(lapply(metadataRaw, names)))
    metadata <- data.table(
        id = sapply(metadataRaw, `[[`, "id"),
        name = sapply(metadataRaw, `[[`, "name"),
        dataTypeName = sapply(metadataRaw, `[[`, "dataTypeName"),
        fieldName = sapply(metadataRaw, `[[`, "fieldName"),
        position = sapply(metadataRaw, `[[`, "position"),
        renderTypeName = sapply(metadataRaw, `[[`, "renderTypeName"),
        tableColumnId = sapply(metadataRaw, `[[`, "tableColumnId"),
        width = sapply(metadataRaw, `[[`, "width"),
        not_subColumns = sapply(sapply(metadataRaw, `[[`, "subColumnTypes"), is.null) )
    return(metadata)
}

##------------------------------------------------------------------------------
## Extract json data
##------------------------------------------------------------------------------
json_to_datatable <- function(rawdata, column_info){
    
    dat_parsed <- lapply(column_info$fieldName,
                         function(x) sapply(rawdata, `[[`, x))
    
    ## Clear up NULLs
    for(j in 1:length(dat_parsed)){
        for(i in 1:length(dat_parsed[[j]])){
            if(is.null(dat_parsed[[j]][[i]])){
                dat_parsed[[j]][[i]] <- NA
            }
        }
    }
    
    names(dat_parsed) <- column_info$name
    dat_parsed <- lapply(dat_parsed, unlist)
    ret <- as.data.table(dat_parsed)
    return(ret)
}

##------------------------------------------------------------------------------
## CONVERT DATA TYPES
##------------------------------------------------------------------------------
convert_types <- function(dt, column_info){
    dt <- copy(dat)
    ## Convert data types for result
    numberColumns <- which(column_info$renderTypeName == "number")
    for(j in as.integer(numberColumns)){
        cat("Converting Numeric Columns",
            which(j == numberColumns), "of", length(numberColumns), "\n")
        set(dt, j = j, value = as.numeric(unlist(dt[, j, with = FALSE])))
    }
    
    dateColumns <- which(column_info$renderTypeName == "calendar_date")
    for(j in as.integer(dateColumns)){
        cat("Converting Date Columns",
            which(j == dateColumns), "of", length(dateColumns), "\n")
        set(dt, j = j, value = as.POSIXct(unlist(dt[, j, with = FALSE])))
    }
    return(dt)
}

if(FALSE){
    ##------------------------------------------------------------------------------
    ## INITIALIZE
    ##------------------------------------------------------------------------------
    ls()
    # rm(list=ls())
    library(geneorama)
    
    ##------------------------------------------------------------------------------
    ## RUN EXAMPLE
    ##------------------------------------------------------------------------------
    
    fourbyfour <- "me59-5fac" # sanitation complaints
    fourbyfour <- "r5kz-chrr" # business
    fourbyfour <- "22u3-xenr" # building violations
    fourbyfour <- "4ijn-s7e5" # food inspections
    fourbyfour <- "ijzp-q8t2" # crime
    fourbyfour <- "6zsd-86xi" # crime (version 2 of the API)
    
    ## GET COLUMN INFO
    base_url <- paste0("https://data.cityofchicago.org/resource/", fourbyfour, ".json")
    column_info <- get_metadata(base_url)
    column_info <- column_info[which(not_subColumns)]  ## No nested fields
    column_info
    
    ## DOWNLOAD JSON
    dat_json <- get_content(base_url = base_url)
    # dat_json <- get_content(base_url = base_url, param = "&$where=date>'2014-01-01'")
    
    ## CONVERT FROM JSON
    dat <- json_to_datatable(rawdata = dat_json, column_info = column_info)
    dat <- convert_types(dat, column_info)
    dat
    
    str(dat)
    
    saveRDS(dat, "foodinspections.Rds")
}


