
#' ---
#' output: github_header
#' ---


rm(list=ls())

## INITIALIZE
library(geneorama)
loadinstall_libraries(c("leaflet", "data.table", "sp", "rgdal", "KernSmooth", "RCurl"))
# library("maptools")

## IMPORT PARK MAPS
# Source: https://data.cityofchicago.org/Parks-Recreation/Parks-Shapefiles/5msb-wbxn
shp_parks <- readOGR("doc/parkmap/parks2012shapefiles", "Parks_Aug2012", stringsAsFactors = FALSE)
shp_parks <- spTransform(shp_parks, CRS("+proj=longlat +datum=WGS84"))


## Plot all the parks
leaflet() %>% addPolygons(data = shp_parks) %>% addProviderTiles("CartoDB.Positron")

## Structure of the "data" part of the shape file
str(shp_parks@data)
# wtf(shp_parks@data) ## <-- Open in excel
shp_parks@data$PARK
shp_parks@data$LABEL
shp_parks@data$LOCATION

## Find likely beaches based on name
i1 <- which(shp_parks@data$BEACH > 0)
i2 <- grep("BEACH", shp_parks@data$LABEL, ignore.case = TRUE)
ii <- unique(i1, i2)

## Plot potential beaches
leaflet() %>% 
	addPolygons(data = shp_parks[ii, ], popup=~LABEL) %>%
	addProviderTiles("CartoDB.Positron")

## Pretty it up and add pretend colors
# RColorBrewer::display.brewer.all(colorblindFriendly=TRUE)
# pal <- leaflet::colorQuantile("Greens", NULL, n = length(ii))
# pal <- leaflet::colorFactor("Greens", NULL, levels = length(ii))
# pal <- leaflet::colorFactor("Greens", levels = length(ii))
pal <- leaflet::colorNumeric('RdYlBu', c(0, 10))
color_numbers <- round(runif(length(ii),0, 10), 2)
leaflet() %>% 
	addPolygons(data = shp_parks[ii, ], popup=~LABEL, weight=.5, fillOpacity=.9,
				color = pal(color_numbers)) %>%
	addProviderTiles("CartoDB.Positron") %>%
	addLegend(pal = pal, 
			  values = 1:10, 
			  opacity = 1,
			  position = "bottomright", 
			  title = "Water poopieness")
