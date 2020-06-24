

rm(list=ls())

library(geneorama)
library(rgdal) #for reading/writing geo files

sourceDir("R")

chi_census_tracts_2010 <- readOGR("https://data.cityofchicago.org/api/geospatial/5jrd-6zik?method=export&format=GeoJSON",
								  stringsAsFactors = FALSE)
str(chi_census_tracts_2010@data)
setcolorder(chi_census_tracts_2010@data, c("statefp10",
										   "countyfp10",
										   "geoid10",
										   "tractce10",
										   "name10",
										   "namelsad10",
										   "commarea_n",
										   "commarea",
										   "notes"))

## CALCULATE CENTROID
centroids <- centroid(chi_census_tracts_2010,
					  iterations = 150,
					  initial_width_step = .01)

chi_census_tracts_2010@data$lat_centroid <- centroids$y
chi_census_tracts_2010@data$lon_centroid <- centroids$x

## SAVE
save(chi_census_tracts_2010, file = "data/chi_census_tracts_2010.RData")

