#' @name   NAsummary
#' @title  Summarize NA values in a matrix or data.frame (or data.table)
#' @author Gene Leynes
#' 
#' @param df            A data.frame to be summarized
#' @param include_nan   Do you want to also see Nan's along with NA's
#'                      Defaults to FALSE
#'
#' @description
#' 		Summarize the available information in a data.frame (or similar) quickly
#'
#' @details
#' 		For a data frame, data.table, or matrix this function creates a summary
#' 		of how many NA's and unique values there are in each column.  Useful for
#' 		a quick summary of how complete your data is, and can be useful to pass
#' 		to other commands; for example to remove columns that only have one
#' 		unique value.
#'
#' @examples
#'  ## Create an example data frame:
#' 	set.seed(100)
#' 	df <- data.frame(ID = 1:30,
#' 					 col1 = sample(c(rep(NA, 5), rpois(25, 7))),
#' 					 col2 = sample(letters[1:5], replace=TRUE),
#' 					 col3 = sample(letters[1:5], replace=TRUE),
#' 					 col4 = NA,
#' 					 col5 = "OneValue",
#' 					 col6 = sample(letters[1:5], replace=TRUE))
#' 	## Create a summary:
#' 	MySummary <- NAsummary(df)
#' 	MySummary
#' 	## Columns with only one unique value:
#' 	rownames(MySummary)[MySummary$nUnique == 1]
#' 	## Columns with 100% NA values:
#' 	rownames(MySummary)[MySummary$rNA == 1]
#'
#'


NAsummary <-function(df, include_nan=FALSE){
	newdf = data.frame(col=1:ncol(df),
					   Count =nrow(df),
					   nNA = sapply(df,function(x)length(x[is.na(x)])))
	
	newdf$rNA = newdf$nNA / newdf$Count
	newdf$rNA = trunc(newdf$rNA*10000)/10000
	
	if(include_nan){
		newdf$nNan = sapply(df,function(x)length(x[is.nan(x)]))
		newdf$rNan = newdf$nNan / newdf$Count
		newdf$rNan = trunc(newdf$rNan*10000)/10000
	}
	
	newdf$nUnique = sapply(df,function(x)length(unique(x)))
	
	newdf$rUnique = newdf$nUnique / newdf$Count
	newdf$rUnique = trunc(newdf$rUnique*10000)/10000
	
	rownames(newdf) = colnames(df)
	return(newdf)
}


if(FALSE){
	rm(list=ls())
	require(geneorama)
	detach_nonstandard_packages()
	source('R/NAsummary.R')
	set.seed(100)
	df <- data.frame(ID = 1:30,
					 col1 = sample(c(rep(NA, 5), rpois(25, 7))),
					 col2 = sample(letters[1:5], replace=TRUE),
					 col3 = sample(letters[1:5], replace=TRUE),
					 col4 = NA,
					 col5 = "OneValue",
					 col6 = sample(letters[1:5], replace=TRUE))
	MySummary <- NAsummary(df)
	MySummary
	## Columns with only one unique value:
	rownames(MySummary)[MySummary$nUnique == 1]
	## Columns with 100% NA values:
	rownames(MySummary)[MySummary$rNA == 1]
}


if(FALSE){
	## DATA TABLE VERSION
	## SLOWER!
	NAsummary <-function(dat, include_nan=FALSE){
		# browser()}
		require(data.table)
		ret <- data.table(column=colnames(dat),
						  Count =nrow(dat))
		ret <- ret[ , nNA := NA_real_][]
		for(j in 1:nrow(ret)){
			set(x = ret,
				i = j,
				j = "nNA", 
				value = sum(is.na(dat[ ,j, with=FALSE])))
		}
		ret <- ret[ , rNA := trunc(nNA / Count * 10000) / 10000][]
		
		if(include_nan){
			ret[ , nNan := NA_real_]
			for(j in 1:nrow(ret)){
				set(ret, 
					i = j, 
					j = "nNan", 
					value=sum(is.nan(unlist(dat[ ,j, with=FALSE]))))
			}
			ret <- ret[ , rNan := trunc(nNan / Count * 10000) / 10000][]
		}
		
		ret <- ret[ , nUnique := NA_real_][]
		for(j in 1:nrow(ret)){
			row_count <- eval(substitute(nrow(dat[ ,.N, X]), 
										 list(X=as.symbol(colnames(dat)[j]))))
			set(ret, i = j, j = "nUnique", value=row_count)
		}
		ret <- ret[ , rUnique := trunc(nUnique / Count * 10000) / 10000][]
		
		return(ret)
	}
}

