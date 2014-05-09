



## Way to do backreference substitution in R to fix short year:
gsub("([0-9][0-9])$", "20\\1", c("3/17/12", "12/18/12"))
## See more in date conversion function (not checked in yet)



## Read time zone info
tzfile <- file.path(R.home("share"), "zoneinfo", "zone.tab")
tzones <- read.delim(tzfile, row.names = NULL, header = FALSE,
					 col.names = c("country", "coords", "name", "comments"),
					 as.is = TRUE, fill = TRUE, comment.char = "#")
head(tzones)
tzones$name

## Round a date time to Date
as.Date(Sys.time())

## This will APPEAR to round the date, but it's actually converting it to 
## something that is equally complicated and just changing how it prints
strptime(Sys.time(), "%Y-%m-%d")
unlist(unclass(strptime(Sys.time(), "%Y-%m-%d")))
## The POSIXlt is a list of the times, whereas ct is numeric


## This is a reminder that the lt is the only one that allows tz conversion
as.POSIXct(Sys.time(), tz = "GMT")  ## Expresses as LOCAL
as.POSIXlt(Sys.time(), tz = "GMT")  ## Expresses as GMT

## How to calculate the difference in local time from UTC
TimeDiff = as.POSIXct(format(Sys.time(), tz = "GMT")) -
	as.POSIXct(format(Sys.time(), tz = ""))
TimeDiff

## How to convert a time that was local to GMT
(now = Sys.time())
(nowAsCharacter = format(now, tz="GMT"))
as.POSIXct(format(nowAsCharacter, tz="GMT"), tz="GMT")


all.equal(
	as.numeric(as.POSIXct("2012-09-20  12:42:55 PM")),
	as.numeric(as.POSIXlt("2012-09-20  12:42:55 PM")),
	as.numeric(as.POSIXct("2012-09-20  12:42:55 PM CST")),
	as.numeric(as.POSIXlt("2012-09-20  12:42:55 PM CST")),
	as.numeric(as.POSIXct("2012-09-20  12:42:55 PM GMT")),
	as.numeric(as.POSIXlt("2012-09-20  12:42:55 PM GMT")))


################################################################################
## Epoch time / regular time conversions
## "2012-09-20 12:42:55 PM" is 1348144975 according to http://www.epochconverter.com/
## "2012-09-20 12:42:55 PM" is 1348162975 according to R
################################################################################

## Original Date
TimeChar = "2012-09-20 12:42:55 PM" ## Original Date/Time
## Epoch time from website
EpochWeb = 1348144975
## Epoch tmie from R
as.numeric(as.POSIXct(TimeChar)) == 1348162975  ## THIS SHOULD BE TRUE!!
EpochR   = 1348162975 ## According to R 

##------------------------------------------------------------------------------
## Conversion: Character to character
##------------------------------------------------------------------------------
as.POSIXct(TimeChar)


##------------------------------------------------------------------------------
## Conversion: Epoch to Date
##------------------------------------------------------------------------------

## Fully correct conversions to local time
as.POSIXct(EpochWeb, origin="1970/01/01", tz="GMT") + TimeDiff
as.POSIXlt(EpochR, origin="1970/01/01", tz="America/Chicago")

##------------------------------------------------------------------------------
## Conversion: Date to Epoch
##------------------------------------------------------------------------------

## Matches website
as.numeric(Sys.time())
as.numeric(as.POSIXct(as.character(Sys.time())))

##------------------------------------------------------------------------------
## Conversion: Character to Epoch
##------------------------------------------------------------------------------

## These conversions match R, but don't match website
as.numeric(as.POSIXct("2012-09-20 12:42:55 PM")) == c(EpochR, EpochWeb)
as.numeric(as.POSIXlt("2012-09-20 12:42:55 PM")) == c(EpochR, EpochWeb)
as.numeric(as.POSIXct("2012-09-20  12:42:55 PM GMT")) == c(EpochR, EpochWeb)
as.numeric(as.POSIXlt("2012-09-20  12:42:55 PM GMT")) == c(EpochR, EpochWeb)


## Time difference doesn't match up because there was a time difference 
## due to DST between US and GMT in September
as.numeric(as.POSIXlt("2012-09-20  12:42:55 PM GMT")) - c(EpochR, EpochWeb)
18000/60/60
as.numeric(TimeDiff)

## This conversion method matches website
as.numeric(as.POSIXct("2012-09-20 12:42:55 PM", tz="GMT")) == c(EpochR, EpochWeb)
as.numeric(as.POSIXlt("2012-09-20 12:42:55 PM", tz="GMT")) == c(EpochR, EpochWeb)


Sys.time()
as.numeric(as.POSIXlt("2012-09-20 12:42:55 PM", tz="America/Chicago"))

as.numeric(as.POSIXct(format("2012-09-20 12:42:55 PM", tz="GMT"), tz="GMT"))

## SUCCESSFUL Round trip conversion (requires "America/Chicago")
format(as.POSIXct("2012-09-20  12:42:55 PM CST"), tz="America/Chicago")



RealEpochTime = as.numeric(as.POSIXct("2012-09-20  12:42:55 PM GMT"))




now = Sys.time()
as.POSIXlt(format(now, tz="GMT"))

nowAsCharacter = format(now)
as.POSIXlt(format(nowAsCharacter, tz="CST"), tz="GMT")











