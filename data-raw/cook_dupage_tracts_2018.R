

rm(list=ls())

geneorama::sourceDir("R")

fnameout <- "data/cook_dupage_tracts_2018.RData"

# UPDATE_TIGRIS <- TRUE    ## FORCE DOWNLOAD
UPDATE_TIGRIS <- FALSE   ## ALLOW CACHING
options("tigris_refresh"=UPDATE_TIGRIS)

## Get census track data
## Note, that because of that little chunk in O'Hare we need DuPage
dupage <- tigris::tracts(state = 17, county = '043', year = 2018)
cook <- tigris::tracts(state = 17, county = '031', year = 2018)
cook_dupage_tracts_2018 <- rbind(dupage, cook)

## GEOCODE TO WARD
wards <- loader("data/chi_wards_2015.RData")
cook_dupage_tracts_2018$ward <- geocode_to_map(as.numeric(cook_dupage_tracts_2018@data$INTPTLAT),
											   as.numeric(cook_dupage_tracts_2018@data$INTPTLON),
											   wards, "ward")

## GEOCODE TO COMMUNITY AREA
comm <- loader("data/chi_community_areas.RData")
cook_dupage_tracts_2018$community <- geocode_to_map(as.numeric(cook_dupage_tracts_2018@data$INTPTLAT),
													as.numeric(cook_dupage_tracts_2018@data$INTPTLON),
													comm, "community")

## GEOCODE TO ZIPCODE AREA
zips <- loader("data/chi_zip_codes.RData")
cook_dupage_tracts_2018$zip <- geocode_to_map(as.numeric(cook_dupage_tracts_2018@data$INTPTLAT),
											  as.numeric(cook_dupage_tracts_2018@data$INTPTLON),
											  zips, "zip")

## CALCULATE CENTROID
centroids <- centroid(cook_dupage_tracts_2018,
					  iterations = 150,
					  initial_width_step = .01)

cook_dupage_tracts_2018@data$lat_centroid <- centroids$y
cook_dupage_tracts_2018@data$lon_centroid <- centroids$x

## SAVE
save(cook_dupage_tracts_2018, file = fnameout)
