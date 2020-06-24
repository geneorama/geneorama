

rm(list=ls())

library(geneorama)
library(rgdal) #for reading/writing geo files

sourceDir("R")

chi_census_tracts_2000 <- readOGR("https://data.cityofchicago.org/api/geospatial/pt6c-hxpp?method=export&format=GeoJSON",
								  stringsAsFactors = FALSE)
str(chi_census_tracts_2000@data)
setcolorder(chi_census_tracts_2000@data, 
			c("objectid", "tract_cens", "census_t_1", 
			  "tract_fips", "census_tra", "tract_numa", "tract_comm", "tract_cr_1", 
			  "data_admin", "tract_crea", "perimeter", "tract_ce_1", "tract_cent", 
			  "shape_area", "shape_len", "tract_ce_3", "tract_ce_2"))

chi_census_tracts_2000@data$perimeter <- as.numeric(chi_census_tracts_2000@data$perimeter)
chi_census_tracts_2000@data$tract_ce_1 <- as.numeric(chi_census_tracts_2000@data$tract_ce_1)
chi_census_tracts_2000@data$tract_cent <- as.numeric(chi_census_tracts_2000@data$tract_cent)
chi_census_tracts_2000@data$shape_area <- as.numeric(chi_census_tracts_2000@data$shape_area)
chi_census_tracts_2000@data$shape_len <- as.numeric(chi_census_tracts_2000@data$shape_len)
chi_census_tracts_2000@data$tract_ce_3 <- as.numeric(chi_census_tracts_2000@data$tract_ce_3)
chi_census_tracts_2000@data$tract_ce_2 <- as.numeric(chi_census_tracts_2000@data$tract_ce_2)


## CALCULATE CENTROID
centroids <- centroid(chi_census_tracts_2000,
					  iterations = 150,
					  initial_width_step = .01)

chi_census_tracts_2000@data$lat_centroid <- centroids$y
chi_census_tracts_2000@data$lon_centroid <- centroids$x

## SAVE
save(chi_census_tracts_2000, file = "data/chi_census_tracts_2000.RData")
