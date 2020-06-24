
## Just analysis 
## see chi_census_tracts_2000.Rds for extraction

rm(list=ls())

library(geneorama)
library(leaflet)
library(rgdal) #for reading/writing geo files
library(rgeos) #for simplification
library(sp)

sourceDir("R")

##==============================================================================
## READ IN 2000 and 2010 TRACTS
##==============================================================================

tracts2000 <- loader("data/chi_census_tracts_2000.RData")
tracts2010 <- loader("data/chi_census_tracts_2010.RData")

##==============================================================================
## READ IN WARD DATA (FROM OTHER STEPS)
##==============================================================================

wards <- loader("data/chi_wards.RData")
city <- maptools::unionSpatialPolygons(wards, rep("Chicago", length.out=length(wards@data$ward)))
tracts <- loader("data/cook_dupage_tracts_2019.RData")

tracts$ward <- geocode_to_map(as.numeric(tracts@data$INTPTLAT),
                              as.numeric(tracts@data$INTPTLON),
                              wards, "ward")
tracts$chicago <- !is.na(tracts$ward)
table(tracts$chicago)
tracts_chicago <- tracts[tracts$chicago==TRUE,]

length(tracts2000@polygons)
length(tracts2010@polygons)
length(tracts_chicago)
length(tracts@polygons)

leaflet() %>%
    addProviderTiles("CartoDB.DarkMatter") %>%
    addPolygons(data=tracts2010, weight=.5, fillOpacity=.05, color="white", smoothFactor=.02) %>%
    addPolygons(data=city, weight=1, fillOpacity=.05, color="yellow",smoothFactor=.02)

leaflet() %>%
    addProviderTiles("CartoDB.DarkMatter") %>%
    addPolygons(data=tracts_chicago, weight=.5, color="white", fill="white", fillOpacity=.2, smoothFactor=.02) %>%
    addPolygons(data=city, weight=1, fillOpacity=.05, color="yellow",smoothFactor=.02)

leaflet() %>%
    addProviderTiles("CartoDB.DarkMatter") %>%
    addPolygons(data=tracts2010, weight=1, fillOpacity=.05, color="white",smoothFactor=.02) %>%
    addPolygons(data=tracts_chicago, weight=.5, fillOpacity=.05, color="yellow", smoothFactor=.02)

leaflet() %>%
    addProviderTiles("CartoDB.DarkMatter") %>%
    addPolygons(data=city, weight=1, fillOpacity=.5, color="white",smoothFactor=.02) %>%
    addPolygons(data=tracts_chicago, weight=1, fillOpacity=.05, color="red",smoothFactor=.02) %>%
    addPolygons(data=tracts2010, weight=.5, fillOpacity=.05, color="yellow", smoothFactor=.02)



