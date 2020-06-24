
rm(list=ls())

library(geneorama)
library(rgdal) #for reading/writing geo files
library(rgeos) #for simplification
library(sp)

sourceDir("R")

##==============================================================================
## READ IN 2000 and 2010 TRACTS
## Unzip, read, delete zipped files
## I believe the source is data.cityofchicago.org
##==============================================================================

fname_tracts_2000 <- "data-raw/Boundaries - Census Tracts - 2000.zip"
fname_tracts_2010 <- "data-raw/Boundaries - Census Tracts - 2010.zip"
dname_tracts_2000 <- "data-raw/Boundaries - Census Tracts - 2000"
dname_tracts_2010 <- "data-raw/Boundaries - Census Tracts - 2010"
unzip(fname_tracts_2000, overwrite = FALSE, exdir = dname_tracts_2000)
unzip(fname_tracts_2010, overwrite = FALSE, exdir = dname_tracts_2010)
chi_census_tracts_2000 <- readOGR(dsn = dname_tracts_2000,
                                  layer = "geo_export_033306ba-39ce-4699-a4ca-280a09037104",
                                  stringsAsFactors = FALSE)
chi_census_tracts_2010 <- readOGR(dsn = dname_tracts_2010,
                                  layer = "geo_export_f54ca4b3-447e-4a61-9f66-c10031b84c24",
                                  stringsAsFactors = FALSE)
unlink(dname_tracts_2000, recursive = T)
unlink(dname_tracts_2010, recursive = T)

# saveRDS(chi_census_tracts_2000, "data/chi_census_tracts_2000.Rds")
# saveRDS(chi_census_tracts_2010, "data/chi_census_tracts_2010.Rds")

save(file = "data/chi_census_tracts_2000.RData",
	 chi_census_tracts_2000)
save(file = "data/chi_census_tracts_2010.RData",
	 chi_census_tracts_2010)

