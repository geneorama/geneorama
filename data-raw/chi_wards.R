rm(list=ls())

library(geneorama)
library(rgdal)

sourceDir("R")

##==============================================================================
## READ IN SHAPE FILES FROM DATA PORTAL
##==============================================================================

# https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Wards-2015-/sp34-6z76
chi_wards_2015 <- readOGR("https://data.cityofchicago.org/api/geospatial/sp34-6z76?method=export&format=GeoJSON",
						  stringsAsFactors = FALSE)
str(chi_wards_2015@data)

chi_wards_2015@data$shape_area <- as.numeric(chi_wards_2015@data$shape_area)
chi_wards_2015@data$shape_leng <- as.numeric(chi_wards_2015@data$shape_leng)

setcolorder(chi_wards_2015@data, c("ward", "shape_area", "shape_leng"))

## CALCULATE CENTROID
centroids <- centroid(chi_wards_2015,
					  iterations = 150,
					  initial_width_step = .01)

chi_wards_2015@data$lat_centroid <- centroids$y
chi_wards_2015@data$lon_centroid <- centroids$x

## SAVE
save(chi_wards_2015, file = "data/chi_wards_2015.RData")



