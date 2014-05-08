
# structure returns the given object with further attributes set.
structure(1:6, dim = 2:3)


#-----------------------------------------------------------
# Under the hood
#-----------------------------------------------------------

#-----------------------------------------------------------
# Startup
#-----------------------------------------------------------
# Very useful help:
?Startup

# Getting and setting USER environmental variable
Sys.getenv('R_USER')
Sys.setenv(R_USER='C:\\Users\\gene.leynes')
Sys.setenv(R_USER='C:\\Documents and Settings\\Gene\\My Documents')
Sys.getenv('R_HOME')
Sys.getenv("R_LIBS_USER")

# Typical start: (NEW)
setwd('~/Dropbox/Milliman/PALAL 21_All_Benefits_All_Runs_Annual')
source('~/Dropbox/R/00 Standard Functions/Function_sourcedir.R')
sourceDir('~/Dropbox/R/00 Standard Functions',F)

# Typical start: (OLD)
rm(list=ls())
setwd('')
source('J:/frm_group/MStarFundResearch/R_Milliman/IMPORTANT/Function_sourceDir.R')
sourceDir('J:/frm_group/MStarFundResearch/R_Milliman/Functions')
# Change working directory to desktop (windows 7)
	setwd(gsub('Documents','Desktop',Sys.getenv("HOME")))
# Change working directory to desktop (windows XP)
	setwd(gsub('My Documents','Desktop',Sys.getenv("HOME")))

# Get Desktop path, then list files
	dir(gsub('My Documents','Desktop',Sys.getenv("HOME")))
	dir(gsub('Documents','Desktop',Sys.getenv("HOME")))

# HELPFUL EXAMPLE OF HOW TO SEE ENV VARIABLES
	names(Sys.getenv())

# Get R version number
	R.Version()

# Change directory to a script (using drag and drop)
	curpath = dirname(getSrcFilename(function(){}, full=TRUE))
	setwd(curpath)
	cat('Now in ', curpath, '\n')
	print(dir())

# Way to load everything into global envir, create .First file, 
# 	then save image for easy reloading
	rm(list=ls())
	.First = function(){
		f=function(x){x=x+1;x=x^2;return(x)}
		CurNames = ls()
		for(nm in CurNames){
			assign(x=nm, value=get(nm), envir=.GlobalEnv)
		}
	}
	save.image('test.RData')
	 

#-----------------------------------------------------------
# Utilities - Packages, libraries, profile code
#-----------------------------------------------------------
# Change warnings options
	options(warn=0)  ## Default: stores warnings until function exit
	options(warn=-1) ## No warnings
	options(warn=1)  ## Warnings print immediately
	
# Try catch
	tryCatch(
		1 + '1', 
		error = function(x) 
			return('it\'s ok, everybody makes mistakes'))

# Raise an Error:
	e = simpleError("some annoying error")

# Replace // with \
	chartr('\\', '/', R.home())

# Detach package
	detach(pos = match("package:graphics", search()))

# List all installed packages
	dimnames(installed.packages())[1]

# Profile some code:
	nr=100;	nc=10;	x=1:nc;	yy=c()
	y=matrix(rnorm(nr*nc),nrow=nr,ncol=nc)

	Rprof("C:/Users/gene.leynes/Desktop/test.out")
	for (i in 1:nrow(y))yy[i]=lm(y[i,]~x)$coefficients[1]
	Rprof(NULL)
	summaryRprof("C:/Users/gene.leynes/Desktop/test.out")

# See the help file examples executed
	example(svd)
	
# Make a png file
	png(file = "plot23000x23000.png", width = 23000, height = 23000, res = 2400)
	print(myplot)
	dev.off()

# Printing within a loop
# if using the GUI, turn off buffering, 
# or use 'flush.console()' after 'cat'.

#===========================================================
# IO
#===========================================================

#-----------------------------------------------------------
# xcode example
# http://dataissexy.wordpress.com/2013/06/01/10-second-rss-parsing-in-r-and-xpath/
#-----------------------------------------------------------
library(XML)
library(RCurl)

xml.url<-"http://dataissexy.wordpress.com/feed/"
rssdoc <- xmlParse(getURL(xml.url))
rsstitle <- xpathSApply(rssdoc, '//item/title', xmlValue)
rssdesc <- xpathSApply(rssdoc, '//item/description', xmlValue)
rssdate <- xpathSApply(rssdoc, '//item/pubDate', xmlValue)



#-----------------------------------------------------------
# Controlling Functions
#-----------------------------------------------------------
# Check for function arguments (manually)
f = function(x,y){
	if(nargs()!=length(formals(f)))
		stop('Something is missing...')
}
f()
# Check for function arguments (automatically)
f = function(x,y){
	curfun = deparse(match.call()[1])
	curfun = substr(curfun,1,nchar(curfun)-2)
	if(length(formals(curfun))!=nargs())
		stop('Something is missing...')
}
f()


#-----------------------------------------------------------
# Two ways to get the arguments of a function
#-----------------------------------------------------------
# match.call
f = function(aa, bb){
	mcall = match.call()
	for(i in 1:length(mcall)){
		cat(i, '\n')
		print(mcall[i])
		cat(substr(mcall[i],1, nchar(mcall[i])))
		cat('\n\n')
	}
	invisible()
}
f(aa='onething', bb=1:100)

# deparse substitute
f = function(aa, bb){
	print(deparse(substitute(aa)))
	print(deparse(substitute(bb)))
	invisible()
}
f(aa='onething', bb=1:100)


#-----------------------------------------------------------
# Bulk Edit Functions
#-----------------------------------------------------------
ff = list.files(recursive=T, pattern='\\.R$')
dat = lapply(ff, readLines)
hasplot = unlist(sapply(dat, function(x)length(grep(x, pattern='plot'))))!=0
missingreset = unlist(sapply(dat, function(x)length(grep(x, pattern='resetGraph'))))==0
# Shows files that have "plot" but is missing "resetGraph"
ff[hasplot&missingreset]



#-----------------------------------------------------------
# Flow Control
#-----------------------------------------------------------
# else if
	xx=c(0,1,2,3)
	tester=function(x){
		if(x==0){
			print('zero')
		} else if(x==1){
			print('one')
		} else {
			print('more than one')
		}
	}
	for (i in 1:length(xx)) tester(xx[i])

# stopifnot (displays error message if condition is false)
	stopifnot(F)

#-----------------------------------------------------------
# Function calls
#-----------------------------------------------------------
# Use mapply to re-use function arguments in subsequent calls
somefun=function(x1,x2,x3,x4,x5,x6,x7,x8,x9){
    ans=x1+x2+x3+x4+x5+x6+x7+x8+x9
    return(ans)
}
somefun(1,2,3,4,5,6,7,8,9)
ArgsThatRarelyChange=list(x3=3,x4=4,x5=5,x6=6,x7=7,x8=8,x9=9)
mapply(somefun, x1=1,x2=2,MoreArgs=ArgsThatRarelyChange)



#-----------------------------------------------------------
# Tables
#-----------------------------------------------------------
# Nice way to summarize by groups
	data(warpbreaks)
	lapply(split(warpbreaks, warpbreaks$tension), summary)

# Make buckets of equal size
# see also: shingle
	library(lattice)
	equal.count(rnorm(100))

# Nice way to format a table
	ftable(UCBAdmissions,
		row.vars =c('Dept'), 
		col.vars = c('Gender','Admit'))

	df=data.frame(
		category=factor(sample(c(1,2,3),20,T),labels=c('a','b','c')),
		time=runif(20,1,5)%/%1,
		LbsEaten=((rnorm(20)^2)*16) %/% 1 / 4)
	df
	ftable(df)

#-----------------------------------------------------------
# Graphics
#-----------------------------------------------------------

# Make a nice set of colors using color ramp
	ramp <- colorRamp(c("red", "blue"))
	rgb( ramp(seq(0, 1, length = 5)), max = 255)
	plot(1:15, 1:15, pch=16, cex=10, col=
		rgb( ramp(seq(0, 1, length = 15)), max = 255))


# Modify a previous plot
	par(mfrow=c(3,1))
	pars=list()
	for(i in 1:3){
		set.seed(10)
		plot(1:(10*i)*i, main=paste('examp', i))
		pars[[i]] = par('usr')
	}
	for(i in 1:3){
		par(mfg=c(i,1))
		par(usr=pars[[i]])
		lines(1:(10*i)*i, col=i+1)
	}

# Plot the "convex hull"
	plot(cars)
	polygon( cars[chull(cars),], col="pink", lwd=3)
	points(cars)

# Plot Stars
	palette(rainbow(12, s = 0.6, v = 0.75))
	stars(mtcars[, 1:7], len = 0.8, key.loc = c(12, 1.5),
		  main = "Motor Trend Cars", draw.segments = TRUE)

# all the point types
	nn=1:50;plot(nn,nn,type='n');for(i in nn)points(i,i,pch=i);rm(i,nn)
	nn=51:100;plot(nn,nn,type='n');for(i in nn)points(i,i,pch=i);rm(i,nn)
	nn=101:150;plot(nn,nn,type='n');for(i in nn)points(i,i,pch=i);rm(i,nn)

# plot a color wheel using RGB
	r=1:100/100;	g=.05;		b=.05
	pie(rep(1,100), col=rgb(r,g,b))

# plot color wheels using heat, topo, terrain, and cm
	par(mfrow=c(2,2), mar=c(0,0,1.5,0))
	pie(rep(1,40),col=heat.colors(40)[1:40], main='heat.colors')
	pie(rep(1,40),col=terrain.colors(40)[1:40], main='terrain.colors')
	pie(rep(1,40),col=topo.colors(40)[1:40], main='topo.colors')
	pie(rep(1,40),col=cm.colors(40)[1:40], main='cm.colors')

# Get HSV colors (where "blue" becomes "#0000FF")
	(hc=rgb2hsv(col2rgb("blue")))
	(SomeHSV=hsv(hc[1,1],hc[2,1],hc[3,1]))
	pie(1, col=SomeHSV)

# Side by side boxplots
	boxplot(len ~ dose, data = ToothGrowth,
			boxwex = 0.25, at = 1:3 - 0.2,
			subset = supp == "VC", col = "yellow",
			main = "Guinea Pigs' Tooth Growth",
			xlab = "Vitamin C dose mg",
			ylab = "tooth length",
			xlim = c(0.5, 3.5), ylim = c(0, 35), yaxs = "i")
	boxplot(len ~ dose, data = ToothGrowth, add = TRUE,
			boxwex = 0.25, at = 1:3 + 0.2,
			subset = supp == "OJ", col = "orange")
	legend(2, 9, c("Ascorbic acid", "Orange juice"),
		   fill = c("yellow", "orange"))

# Add a simple fitted line
	plot(cars)
	(z <- line(cars))
	abline(coef(z))

# Identify points on a plot
	plot(mtcars$mpg,mtcars$hp)
	identify(mtcars$mpg,mtcars$hp,label=rownames(mtcars))
	
# Make two plots on the same canvas
# Legend
# Random walk 
# Tsay book cover
	set.seed(123456)
	## White noise
	e = rnorm(500)
	## Random walk
	randwalk = cumsum(e)
	## Trend
	trend = 1:500
	## Plots
	par(mar=rep(5,4))
	## deterministic trend + noise
	plot.ts(0.5 * trend + e, lty=1, ylab='', xlab='')
	## random walk with drift
	lines(0.5 * trend + cumsum(e), lty=2)
	## random walk (same scale)
	lines(randwalk, lty=3, col='red')
	par(new=T)
	## random walk (own scale)
	plot.ts(randwalk, lty=3, axes=FALSE, col='red')
	axis(4, pretty(range(randwalk)))
	legend(10, 18.7, legend=c('deterministic trend + noise (left)',
							  'random walk w/ drift (left)', 
							  'random walk (left+right)'),
		   lty=c(1, 2, 3), col=c('black', 'black', 'red')) 


# Add a background color to just the plot
# (Boxplot example)
	dat=data.frame(x=gl(10,20),y=rnorm(10*20))
	plot(dat)
	# ADD THE BACKGROUND
	tmp=par()$usr
	rect(tmp[1], tmp[3], tmp[2], tmp[4], col = "lightyellow")
	plot(dat, add=TRUE)

# Add a background color to just the plot
# (Non-boxplot example)
	dat=data.frame(x=gl(10,20),y=rnorm(10*20))
	dat$x=as.numeric(dat$x)
	plot(dat, type='n')
	# ADD THE BACKGROUND
	tmp=par("usr")
	rect(tmp[1], tmp[3], tmp[2], tmp[4], col = "lightyellow")
	points(dat)


#-----------------------------------------------------------
# Lattice Graphics
# also, see end for "great plot example"
#-----------------------------------------------------------

# Make xyplot plot in order
	lattice.options(default.args = list(as.table = TRUE)) 

# xy plot example with panel
	phi = matrix(rnorm(19000), nrow=1000, ncol=19)
	av = .03 + .05 * phi
	av = t(apply(1+av, 1, cumprod))
	spx = (.03 + .05 * phi)^2
	spx = t(apply(1+spx, 1, cumprod))
	#plot(av[1,],ylim=range(av));apply(av,1,lines)
	#plot(spx[1,],ylim=range(spx));apply(spx,1,lines)
	dat = data.frame(
			av=as.vector(av),
			spx=as.vector(spx),
			dif=as.vector(av-spx),
			time = rep(2:20,each=1000))

	lattice.options(default.args = list(as.table = TRUE)) 
	xyplot(dif~spx|time, dat, 
		strip = strip.custom(strip.levels = TRUE),
		scales = "free",
		panel=function(x,y){
			panel.xyplot(x,y)
			panel.abline(h=c(0,1,1.5),lty=2)
		}
	)


#-----------------------------------------------------------
# Dates
#-----------------------------------------------------------
# show sub second time
	options(digits.secs=4)

# For details see
	?DateTimeClasses

## Example date / times
	set.seed(100)
	datetime = ISOdatetime(year=2012, month=10, day=29, hour=0, min=0, sec=0)
	datetimes = datetime + sort(runif(5, min=0, max=60 * 60 * 24 * 30))
	datetimes
	# [1] "2012-10-30 16:35:45 CDT" "2012-11-05 16:31:27 CST" 
	# [3] "2012-11-07 04:35:29 CST" "2012-11-12 00:21:19 CST" 
	# [5] "2012-11-14 12:40:19 CST"
	unclass(datetimes)
	# [1] 1351632945 1352154687 1352284530 1352701280 1352918420
	data.frame(unclass(as.POSIXlt(datetimes)))
	#        sec min hour mday mon year wday yday isdst
	# 1 45.12583  35   16   30   9  112    2  303     1
	# 2 27.12267  31   16    5  10  112    1  309     0
	# 3 29.75937  35    4    7  10  112    3  311     0
	# 4 19.74392  21    0   12  10  112    1  316     0
	# 5 19.74719  40   12   14  10  112    3  318     0

	as.POSIXct(1472562988, origin = "1960-01-01") # local
	as.POSIXct(1472562988, origin = ISOdatetime(1960,1,1,0,0,0)) # local
	as.POSIXct(1472562988, origin = "1960-01-01", tz = "GMT") # UTC

# strftime is a wrapper for "fromat"
	format(datetimes, "%H:%M:%OS3")
	format(datetimes, "%Y-%m-%d")

# Output of strftime is char
# Use round to get dates, but convert to POSIXct; default format is lt
	as.POSIXct(round(datetimes, "day"))

# strptime can convert char to date / time (sometimes)
	strptime(c("02/27/92 23:03:20", "02/27/92 22:29:56"), "%m/%d/%y %H:%M:%S")



# Get WeekNumber from dates (add one?)
	dates = c("15-08-2005", "01-01-2005", 
			"15-01-2005", "08-08-2005", "08-08-2005")
	as.factor(format(as.Date(dates,"%d-%m-%Y"),"%W"))

#-----------------------------------------------------------
# Strings / Factors / low level manipulation
#-----------------------------------------------------------
# Find characters in a string
	x=deparse(mean)[2]#"UseMethod(\"mean\")"
	gregexpr('u',deparse(mean)[2])#-1
	gregexpr('s',deparse(mean)[2])#2
	gregexpr('\"',deparse(mean)[2])#11 16

# Create an error that gives the c() stuff
	as.factor(etflist,levels=etflist)

# Extract factor data
	somestupidfactor = factor(c('quit','bob','total','open','zodd','post'))
	levels(somestupidfactor)[somestupidfactor]

#way to repeat factor data, as a character, three times
	rep(I(x[[1]]),each=3)

# Make NA's their own factor
	## suppose you want "NA" as a level, and to allow missing values.
	(x <- factor(c(1, 2, NA), exclude = NULL))

# Remove NA values
	residsNaomit = substituteNA(resids, type = c("zeros"))

# Split a string
	sometext = c('Bond-FRN','Bond-Gov','Bond-Debt','Bond-ABS')
	do.call("rbind",strsplit(sometext," - "))

# gsub
	rownames(tstatP1) = gsub('retIndexPn','',rownames(tstatP1)) 

# add a leading 0
	sprintf("%02.0f", pi)

# Format a number to be a string with n digits
	formatC(pi, digits=0, width=5, flag='0')

#-----------------------------------------------------------
# List things
#-----------------------------------------------------------
# Ways to list objects
	ll(dimensions=TRUE)
	ll(dimensions=TRUE)[order(ll(dimensions=TRUE)$Class),]
	ll(dimensions=TRUE)[ll(dimensions=TRUE)$Class != 'function',]
	lll(1)
	tempdf = data.frame(x=rnorm(100),y=runif(100))
	typeof(tempdf)
	is.what(tempdf)
	class(tempdf)
	mode(tempdf)

# list all methods
	methods(class="data.frame")
	methods(class="systemfit")
	methods(plot)

#list all commands
	for(i in 1:length(search())) {print(ls(i))}

#-----------------------------------------------------------
# File I/O
#-----------------------------------------------------------
# Write a file
	tempdf = data.frame(x=rnorm(100),y=runif(100))
	write.table(tempdf,file="temp.txt", quote=T,
		row.names=T, col.names=T, append=F, na="#N/A", sep="\t")

# Read a file
	temp = read.delim('Data/temp.txt', row.names=c(1), header=TRUE, na.string="")

# append vector to a file
	cat(rnorm(1000), file="TestCatFunction.txt",append=T)

# Save and Load a workspace
	save.image('Data/RawData.RData')
	load('Data/workspace.RData')

#-----------------------------------------------------------
# Matching and subsetting
#-----------------------------------------------------------
# Match and %in%
	match('OH', state.abb) # 35
	match(state.abb, 'OH') # NA,NA,...,NA,NA,1,NA,NA,NA,NA,...
	'OH' %in% state.abb # TRUE
	state.abb %in% 'OH' # FALSE FALSE FALSE.... TRUE FALSE FALSE....

# Subset
	head(airquality)
	head(subset(airquality, Temp > 80, select = c(Ozone, Temp)))
	head(subset(airquality, Day == 1, select = -Temp))
	head(subset(airquality, select = Ozone:Wind))

# Combine
	require(gdata)
	a  <-  matrix(rnorm(12),ncol=4,nrow=3)
	b  <-  1:4
	combine(a,b)
	combine(x=a,b)
	combine(x=a,y=b)
	combine(a,b,names=c("one","two"))

# set functions
	?identical
	(x <- c(sort(sample(1:20, 9)),NA))
	(y <- c(sort(sample(3:23, 7)),NA))
	union(x, y)
	intersect(x, y)
	setdiff(x, y)
	setdiff(y, x)
	setequal(x, y)
	is.element(x, y)# length 10
	is.element(y, x)# length  8

# all.equal
	?identical()
	d45 <- pi*(1/4 + 1:10)
	all.equal(tan(d45), rep(1,10))         # TRUE, but
	all      (tan(d45) == rep(1,10))       # FALSE, since not exactly
	all.equal(tan(d45), rep(1,10), tol=0)  # to see difference

#-----------------------------------------------------------
# Reshape using Pivot function
# http://stackoverflow.com/questions/5307313/fastest-tall-wide-pivoting-in-r
#-----------------------------------------------------------
tall <- data.frame( 
	int = rep(1:100, 100),
	fac = rep( paste('v',1:100,sep=''), each = 100),
	val = 1:1000) [-(1:5), ]
tall <- tall[sample(1:nrow(tall)), ]

pivot = function(col, row, value) {
	# browser() }
	col = as.factor(col)
	row = as.factor(row)
	mat = array(
		dim = c(nlevels(row), nlevels(col)), 
		dimnames = list(levels(row), levels(col)))
	mat[(as.integer(col) - 1L) * nlevels(row) + as.integer(row)] = value
	mat
}

wide <- with(tall, pivot(fac, int, val))
tall[1:10, 1:3]
wide[1:10, 1:10]
system.time( replicate(100, wide <- with(tall, tapply( val, list(int, fac), identity))))
system.time( replicate(100, wide <- with(tall, pivot(fac, int, val))))

#-----------------------------------------------------------
## Wide to tall using data.table
#-----------------------------------------------------------
dt <- data.table(uid=c("a","b"), var1=c(1,2), var2=c(100,200))
dt
melt(dt, id=c("uid"))
dt[, list(variable = names(.SD), value = unlist(.SD, use.names = F)), by = uid]


#-----------------------------------------------------------
# Tables and apply functions 
# Depricated: Now use data.table
#-----------------------------------------------------------
# aggregate.table
	library(gdata)
	g1 <- sample(letters[1:5], 1000, replace=TRUE)
	g2 <- sample(LETTERS[1:3], 1000, replace=TRUE )
	dat <- rnorm(1000)
	stderr <- function(x) sqrt( var(x,na.rm=TRUE) / nobs(x) )

	(means   <- aggregate.table( dat, g1, g2, mean ))
	(stderrs <- aggregate.table( dat, g1, g2, stderr ))
	(ns      <- aggregate.table( dat, g1, g2, nobs ))

# apply - some of the examples
	## Compute row and column sums for a matrix:
	(x <- cbind(x1 = 3, x2 = c(4:1, 2:5)))
	dimnames(x)[[1]] <- letters[1:8]
	apply(x, 2, mean, trim = .2)
	col.sums <- apply(x, 2, sum)
	row.sums <- apply(x, 1, sum)
	rbind(cbind(x, Rtot = row.sums), Ctot = c(col.sums, sum(col.sums)))

	(ma <- matrix(c(1:4, 1, 6:8), nrow = 2))
	apply(ma, 1, table)  #--> a list of length 2
	apply(ma, 1, stats::quantile)# 5 x n matrix with rownames

# tapply "Pivot Table"
	tapply(airquality$Ozone, airquality$Month, length)
	tapply(airquality$Ozone, airquality$Month, mean, na.rm = T)

# sapply
	newdf$nUnique = sapply(sapply(df[,1:ncol(df)],unique),length) 

# Example of mapply
	# The function:
	fx2 = function (x,a) (x-a)^2+1
	# Just for fun:
	optimize(fx2,c(0,1),tol=.00001,a=1/3)

	# A line where a is constant
	xx=seq(0, 1, .05)
	aa=rep(1/3, 21)
	yy=mapply(fx2, x=xx, a=aa)
	plot(xx, yy, type='l')

	# A line where a varies
	xx=seq(0, 1, .05)
	aa=seq(1/4, 5/12, (5/12-1/4)/(length(xx)-1))
	yy=mapply(fx2, x=xx, a=aa)
	lines(xx, yy, col='blue')


#-----------------------------------------------------------
# Simple fitting / statistics / plots
#-----------------------------------------------------------
# curve
	curve(x^3-3*x, -2, 2)
	curve(x^2-2, add = TRUE, col = "violet")

# spline
	n <- 9
	x <- 1:n
	y <- rnorm(n)
	plot(x, y, main = paste("spline[fun](.) through", n, "points"))
	lines(spline(x, y))
	lines(spline(x, y, n = 201), col = 2)

# par
	x=matrix(rnorm(21),nrow=7)
	par(mfrow=c(3,1))
	for (i in 1:3) plot(x[,i])

#bandplot #2 (and lm)
	x <- abs(rnorm(500))
	y <- rnorm(500, mean=2*x, sd=2+2*x)
	plot(x,y )
	reg <- lm(y~x)
	summary(reg)
	bandplot(x,y)
	bandplot(predict(reg),resid(reg))

# Boxplot Example
	g=factor(round(10*runif(10*100)))
	x=rnorm(10*100)+sqrt(as.numeric(g))
	xg=split(x,g)
	boxplot(xg,col='lavender',notch=T,var.width=T)

#-----------------------------------------------------------
# Useful Functions
#-----------------------------------------------------------
	II = function(x) I(as.character(x))
	IM = function(x) as.data.frame(as.matrix(x))
clipper = function(x)
	{
	#writeClipboard(x,format=1)
	write.table(x,"clipboard",sep="\t",col.names=NA)
	}

clipped = function()
	{
	read.delim("clipboard")
	}
NAsummary = function(df){
	newdf = data.frame(Count=rep(nrow(df),ncol(df)))
	rownames(newdf) = colnames(df)
	newdf$nNA = nrow(df)-sapply(df,function(x)length(na.omit(x)))
	newdf$rNA = newdf$nNA / newdf$Count
	newdf$rNA = trunc(newdf$rNA*10000)/10000
	newdf$nUnique = sapply(df, function(x)length(unique(x)))
	newdf$rUnique = newdf$nUnique / newdf$Count
	newdf$rUnique = trunc(newdf$rUnique*10000)/10000
	return(newdf)
	}

#-----------------------------------------------------------
# Uncategorized
#-----------------------------------------------------------
# recode
	(x<-rep(1:3,3))
	## [1] 1 2 3 1 2 3 1 2 3
	recode(x, "c(1,2)='A'; else='B'")
	## [1] "A" "A" "B" "A" "A" "B" "A" "A" "B"
	recode(x, "1:2='A'; 3='B'")
	## [1] "A" "A" "B" "A" "A" "B" "A" "A" "B"


# Merge
	MFs = merge(MFs,VAfunds03, by.x = "SecId", by.y = "SecId")

# Merge
	params <- data.frame(species = c("WP", "WL"),
			b0 = c(32.516, 85.150),
			b1 = c(0.01181, 0.00841))
	#  species     b0      b1
	#      WP 32.516 0.01181
	#      WL 85.150 0.00841
	trees <- ufc[ufc$species 
		%in% params$species & !is.na(ufc$height.m),][1:3, ]
	#   plot tree species dbh height dbh.cm height.m
	#3     2    2      WL 480    330   48.0       33
	#20    4    9      WP 299    240   29.9       24
	#26    5    6      WP 155    140   15.5       14
	trees <- merge(trees, params)

	#  species plot tree dbh height dbh.cm height.m     b0      b1
	#1      WL    2    2 480    330   48.0       33 85.150 0.00841
	#2      WP    4    9 299    240   29.9       24 32.516 0.01181
	#3      WP    5    6 155    140   15.5       14 32.516 0.01181

# Expand Grid
	jcetable <- expand.grid(
	 event=c('Wheezing at any time',
			 'Wheezing and breathless',
			 'Wheezing without a cold',
			 'Waking with tightness in the chest',
			 'Waking with shortness of breath',
			 'Waking with an attack of cough',
			 'Attack of asthma',
			 'Use of medication'),
	 method=c('Mail','Telephone'), 
	 sex=c('Male','Female'),
	 what=c('Sensitivity','Specificity'))

# Make a named list	
	test = list()
	for (i in seq(10)) 
		test[[paste('m',i,sep='')]]=runif(10)*i*2
	sapply(test,mean)


# Data Frame VS. Matrix
	df=data.frame(x=1:10,y=rnorm(10))	;	
	mat=matrix(c(x=1:10,y=rnorm(10)),ncol=2)
	colnames(mat) = c('x','y')

	df['x'] 	;	mat['x'] 	# Data frame 	vs. NA
	df[,'x']	;	mat[,'x'] 	# Vector		vs. Vector
	df[['x']] 	;	mat[['x']] 	# Vector		vs. subscript out of bounds
	df$'x'   	;	mat$'x' 	# Vector		vs. ERROR: operator is invalid for atomic vectors
	df$x      	;	mat$x 		# Vector		vs. ERROR: operator is invalid for atomic vectors
	df$x[1]  	;	mat$x[1] 	# Vector		vs. ERROR: operator is invalid for atomic vectors
	df[[1,2]]	;	mat[[1,2]] 	# Numeric Vec 	vs. Numeric Vec
	df[1,2]   	;	mat[1,2]	# Numeric Vec	vs. NAMED Vec





#-----------------------------------------------------------
# Great plot example
#-----------------------------------------------------------
#xyplot
library(lattice)
library(grid)

### read the data
fname="http://addictedtor.free.fr/graphiques/data/150/data.txt"
d <- read.csv(file(fname))

### workaround so that lattice does not order bank names alphabetically
d$bank <- ordered(d$bank, levels=d$bank)

### setup the key
k <- simpleKey(c("Q2 2007",  "January 20th 2009"))
k$points$fill <- c("lightblue", "lightgreen")
k$points$pch <- 21
k$points$col <- "black"
k$points$cex <- 1

list1=list(pch=21, fill=c("lightblue", "lightgreen"), 
		cex=4, col="black")

### create the plot
dotplot(bank ~ MV2007 + MV2009, data=d, horiz=T,
	par.settings = list(superpose.symbol = list1),
	xlab="Market value ($Bn)", key=k,
	panel=function(x, y, ...){
		panel.dotplot(x, y, ...)
	 	grid.text(
			unit(x, "native"), unit(y, "native"),
			label=x, gp=gpar(cex=.7))
	 })

#-----------------------------------------------------------
# Programming
#-----------------------------------------------------------
# try example
WriteAttempt=try(
		write.table(x, file=fpname, append=F, quote=FALSE, 
				sep = ",", eol = "\n", na="", dec=".", row.names=FALSE, 
				col.names=TRUE, qmethod=c("escape", "double")), silent=TRUE)
if("try-error" %in% class(WriteAttempt)){
	write.table(x, file=fpnameTemp, append=F, quote=FALSE, 
			sep = ",", eol = "\n", na="", dec=".", row.names=FALSE, 
			col.names=TRUE, qmethod=c("escape", "double"))
	openFile(fpnameTemp)
}else{
	openFile(fpname)
}

# try to install packages
libs=c('mgcv','pppppppp')
xx = sapply(libs, function(x)try(library(x, 
		character.only = TRUE), silent=TRUE))
xx = sapply(xx, function(x) 'try-error' %in% class(x))
xx=xx[xx]
sapply(names(xx), function(x) install.packages(x, repos='http://cran.r-project.org'))
sapply(names(xx), function(x)try(library(x, character.only = TRUE)))




#-----------------------------------------------------------
# Copy out all the functions in a package
#-----------------------------------------------------------
## Gene Leynes
## 4/27/11
getFormals = function(x){
	Names = names(formals(x))
	Vals = as.character(formals(x))
	#Vals[Vals=='']="INPUT"
	ret = paste(Names,Vals,sep='=',collapse=', ')
	ret = gsub('\\=$', '', ret)
	ret = gsub('\\=,', ',', ret)
	ret = paste('(',ret,')', sep='')
	ret
}
#source("J:\\frm_group\\R\\00 Standard Functions\\Function_getFormals.R")
funs = ls(which(search()=="package:RODBC"))
funargs = sapply(funs, getFormals)
ret = cbind(Functions=funs, Function_Arguments=funargs)
clipper(ret)




#-----------------------------------------------------------
# Make a .First function that does stuff
#-----------------------------------------------------------
## 5/20/12
.First=function(){

	library(base)
	library(stats)
	library(mgcv)
	
	library(graphics)
	library(grDevices)
	library(utils)
	library(datasets)
	library(methods)
	library(PBSmodelling)
	#if(!require(gdata)) stop()
	#if(!require(zoo)) stop()
	#if(!require(lattice)) stop()
	#if(!require(quadprog)) stop()

	# The following code is specific to the GUI stuff...
	cat('Starting GUI\n')
	#assign(x='DebugMode', value=1, envir=.GlobalEnv)
	DebugMode <<- FALSE
	options(stringsAsFactors=FALSE)

	## LOAD FUNCTIONS
	source('Functions/appLoadFunctions.R')
	appLoadFunctions()

	## SET CurrentMode MANUALLY AND CREATE GUI
	CurrentMode <<- 1
	loadGUI()

	cat('Finished Loading Application\n')
}

save.image(file='loadgui.RData')



