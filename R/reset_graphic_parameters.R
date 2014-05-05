
##
## Reset graphic paramaters to default by creating a new plot window
##
## GWL - 2014-05-05 - Adding to geneorama
##

## Usage: call reset_graphic_parameters() to start a new graphics window
## and reset back to the original par().  

## Known issues: 
##    Calling this function will create Rplot[n].png files under certain
##    circumstances, probably when called from the command line.
##    

reset_graphic_parameters <- function(){
  dev.new()
  op <- par(no.readonly = TRUE)
  dev.off()
}
