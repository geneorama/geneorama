rm(list=ls())

library(geneorama)
library(rgdal)

sourceDir("R")

##==============================================================================
## READ IN SHAPE FILES FROM DATA PORTAL
##==============================================================================

chi_zip_codes <- readOGR("https://data.cityofchicago.org/api/geospatial/gdcf-axmw?method=export&format=GeoJSON",
						 stringsAsFactors = FALSE)
str(chi_zip_codes@data)
chi_zip_codes@data$shape_area <- as.numeric(chi_zip_codes@data$shape_area)
chi_zip_codes@data$shape_len <- as.numeric(chi_zip_codes@data$shape_len)

## CALCULATE CENTROID
centroids <- centroid(chi_zip_codes,
					  iterations = 150,
					  initial_width_step = .01)

chi_zip_codes@data$lat_centroid <- centroids$y
chi_zip_codes@data$lon_centroid <- centroids$x

## SAVE
save(chi_zip_codes, file = "data/chi_zip_codes.RData")


