

## Originally from "weather_datatable_60602.R"


##==============================================================================
##==============================================================================
## PROCESS OUTPUT
##==============================================================================
##==============================================================================


##------------------------------------------------------------------------------
## INITIALIZATION
##------------------------------------------------------------------------------

rm(list=ls())
# gc()
# library(geneorama)
# detach_nonstandard_packages()
library(geneorama)
loadinstall_libraries(c("geneorama", "data.table", "ggplot2"))
sourceDir("functions/")

##------------------------------------------------------------------------------
## LOAD DATA
##------------------------------------------------------------------------------
my_output <- readRDS('data/weather_mongo_60602.Rds')


##------------------------------------------------------------------------------
## Unlist and convet to matrix
##------------------------------------------------------------------------------

## Sample records to see if there is a typical set of names
## Use consensus to create a list of "master names"
set.seed(10)
ii <- sort(sample(x = 1:length(my_output), 
                  size = min(length(my_output), 1e4) ))
SampleNames <- sapply(my_output[ii], function(x) 
    names(unlist(x, recursive = T)))
SampleNamesCollapsed <- sapply(SampleNames, function(x) paste(x, collapse=","))
NameSummary <- dftab(SampleNamesCollapsed, total = FALSE) / length(SampleNamesCollapsed)
NameSummary

MasterNameList <- SampleNames[match(rownames(NameSummary),
                                    SampleNamesCollapsed)]
MasterNames <- unique(unlist(MasterNameList))
MasterNames

## Make a matrix to match the size of the number of records / fields
my_matrix <- matrix(NA, nrow = length(my_output), ncol=length(MasterNames))
colnames(my_matrix) <- MasterNames
dim(my_matrix)

## Unlist each element
for(i in 1:length(my_output)){
    if(i%%10000 == 0) print(i)
    my_matrix[i, ] <- unname(unlist(my_output[[i]], recursive = TRUE)[MasterNames])
}


##------------------------------------------------------------------------------
## Convert to data.table
##------------------------------------------------------------------------------
dat <- as.data.table(data.frame(my_matrix, stringsAsFactors = FALSE))
dat <- dat[ , lapply(.SD, 
                     gsub, 
                     pattern = "%$",
                     replacement ="")]
dat <- dat[ , lapply(.SD, 
                     type.convert, 
                     as.is = TRUE,
                     na.strings = c("NA", "Na", "na","NULL", "Null", "null"))]
convert_datatable_int_to_num(dat)
if(FALSE){
    str(dat)
    NAsummary(dat)
}

##------------------------------------------------------------------------------
## Open example in Excel and figure out whats going on
##------------------------------------------------------------------------------
temp <- dat[sort(sample(1:nrow(dat), 1e4))]
# wtf(temp)
rm(temp)

## Extract date
dat[,grep("^when", colnames(dat)),with=FALSE]
dat[,what.id.date := as.numeric(gsub("[[:digit:]]+-","",what.id))]
dat[, date := ifelse(is.na(what.id.date), 
                     when.date, 
                     what.id.date)]
if(FALSE){
    table(is.na(dat$date))
}

## Convert times to iDate
dat[ , idate := as.IDate(date/1000/86400, origin="1970-01-01")]
dat[ , itime := as.ITime(date/1000, origin=as.IDate("1970-01-01"))]

## Sometimes the unix time isn't in 1000's... fix those
dat[ ,.N, keyby=idate]
# dat[idate==" 1970-01-16", list(date=as.IDate(when.date/86400, origin="1970-01-01"))]
dat[idate==" 1970-01-16", idate := as.IDate(date/86400, origin="1970-01-01")]
dat[idate==" 1970-01-16", itime := as.ITime(date, origin=as.IDate("1970-01-01"))]

dat[ ,.N, keyby=idate]

if(FALSE){
    hist(dat[ ,.N, idate]$N)
    ggplot(dat[ ,.N, keyby=idate]) + 
        aes(x=idate,y=N) + 
        geom_line() + 
        geom_point(size=I(.4)) + 
        labs(title = paste0("Number of obs per day\n",
                            "for Mongo weather data\n"))+ 
        theme(plot.title = element_text(size = 20, color = "Black"))
}

## Get rid of "forecasts"
dat <- dat[ , -grep("forecast", colnames(dat), ignore.case=TRUE), with=FALSE]
dat <- dat[ , -grep("icon$", colnames(dat), ignore.case=TRUE), with=FALSE]
## Get rid of fields that we don't need
dat[ , X_id := NULL]
dat[ , type := NULL]
dat[ , .N, what.type]
dat <- dat[what.type!="forecast"]
if(FALSE){
    NAsummary(dat)
}
dat <- dat[ , NAsummary(dat)$nNA < nrow(dat), with=FALSE]
dat[ , what.id.date := NULL]
dat[ , when.etl_last_updated := NULL]
dat[ , when.shardtime := NULL]
dat[ , when.date := NULL]

dat[ , .N, list(what.station.station_id, what.station.station_name)]
if(FALSE){
    dat
    NAsummary(dat)
    
    ggplot(dat[ ,.N, keyby=idate]) + 
        aes(x=idate,y=N) + 
        geom_line() + 
        geom_point(size=I(.4)) + 
        labs(title = paste0("Number of obs per day\n",
                            "for Mongo weather data\n"))+ 
        theme(plot.title = element_text(size = 20, color = "Black"))
}

dat <- dat[!is.na(what.temp_f)]
if(FALSE){
    ggplot(dat) + 
        aes(x=idate ,y=what.temp_f, colour=what.station.station_name) + 
        geom_line() + 
        geom_point(size=I(.4)) + 
        labs(title = paste0("Daily Temp by Station Name\n"))+ 
        theme(plot.title = element_text(size = 20, color = "Black"))
}

dat <- dat[!is.na(what.temp_f)]
dat <- dat[what.station.station_name == "Soldier Field"]
dat <- dat[idate >= "2013-04-01"]


if(FALSE){
    ggplot(dat[,list(what.temp_f,idate=as.factor(round_weeks(idate)))]) + 
        aes(x=idate ,y=what.temp_f) + 
        geom_boxplot() + 
        labs(title = paste0("Daily Temp\n"))+ 
        theme(plot.title = element_text(size = 20, color = "Black"))
}


## Split out wind and add that
wind <- strsplit(dat$what.wind, " at ")
wind <- data.table(do.call(rbind, wind))
setnames(wind, c('dir', 'mph'))
wind[ , mph := as.numeric(gsub(" mph", "", mph))]
dat[ , wind_dir := wind$dir]
dat[ , wind_mph := wind$mph]
if(FALSE){
    dcast.data.table(wind,formula = dir~mph, value.var="mph", fun.aggregate=length)
}

dat

saveRDS(dat, "data/weather_datatable_60602.Rds")
