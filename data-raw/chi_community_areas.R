rm(list=ls())

library(geneorama)
library(rgdal)

sourceDir("R")

##==============================================================================
## READ IN SHAPE FILES FROM DATA PORTAL
##==============================================================================

# https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Community-Areas-current-/cauq-8yn6
# https://data.cityofchicago.org/resource/cauq-8yn6
chi_community_areas <- readOGR("https://data.cityofchicago.org/api/geospatial/cauq-8yn6?method=export&format=GeoJSON",
							   stringsAsFactors = FALSE)
str(chi_community_areas@data)
chi_community_areas@data$area <- NULL
chi_community_areas@data$perimeter <- NULL
chi_community_areas@data$area_num_1 <- NULL
chi_community_areas@data$comarea <- NULL
chi_community_areas@data$comarea_id <- NULL

str(chi_community_areas@data)
setcolorder(chi_community_areas@data, c("community","area_numbe","shape_area","shape_len"))

chi_community_areas@data$shape_area <- as.numeric(chi_community_areas@data$shape_area)
chi_community_areas@data$shape_len <- as.numeric(chi_community_areas@data$shape_len)

## CALCULATE CENTROID
centroids <- centroid(chi_community_areas,
					  iterations = 150,
					  initial_width_step = .01)

chi_community_areas@data$lat_centroid <- centroids$y
chi_community_areas@data$lon_centroid <- centroids$x

## SAVE
save(chi_community_areas, file = "data/chi_community_areas.RData")

