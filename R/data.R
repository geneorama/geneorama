#' @title Chicago's 77 Community Areas
#' @name chi_community_areas
#'
#' Chicago census tracts for 2000
#'
#' @format A SpatialPolygonsDataFrame with 5 slots and 878 Polygons:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
#' @source \url{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Community-Areas-current-/cauq-8yn6}
#' 
#' @export
#' 
"chi_community_areas"


#' Chicago zip codes
#'
#' Spatial data for Chicago's zip codes
#'
#' @format A SpatialPolygonsDataFrame with 5 slots and 61 Polygons:
#' \describe{
#'   \item{objectid}{?}
#'   \item{shap_area}{num: shape area}
#'   \item{shape_len}{num: shape boundary length}
#'   \item{zip}{char: zipcode}
#'   ...
#' }
#' @source \url{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-ZIP-Codes/gdcf-axmw}
"chi_zip_codes"



#' chi_wards
#'
#' Spatial data set for Chicago's 50 wards, as of 2015
#'
#' @format A SpatialPolygonsDataFrame with 5 slots and 878 Polygons:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
#' @source \url{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Wards-2015-/sp34-6z76}
"chi_wards_2015"




#' chi_census_tracts_2000
#'
#' Chicago census tracts for 2000
#'
#' @format A SpatialPolygonsDataFrame with 5 slots and 878 Polygons:
#' \describe{
#'   \item{objectid}{Object id}
#'   \item{tract_cens}{Census year}
#'   \item{census_t_1}{10 digit GEOID}
#'   \item{tract_fips}{State / County (17031)}
#'   \item{census_tra}{Remaining 6 digits of geoid}
#'   \item{tract_numa}{}
#'   \item{tract_comm}{Community area number}
#'   \item{tract_cr_1}{blank}
#'   \item{data_admin}{blank}
#'   \item{tract_crea}{blank}
#'   \item{perimeter}{blank}
#'   \item{tract_ce_1}{Numeric - ?}
#'   \item{tract_cent}{Numeric - ?}
#'   \item{shape_area}{Numeric – Shape area}
#'   \item{shape_len}{Numeric – Shape length?}
#'   \item{tract_ce_3}{Numeric – Longitude}
#'   \item{tract_ce_2}{Numeric – Latitude}
#'   ...
#' }
#' @source \url{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Census-Tracts-2000/pt6c-hxpp}
"chi_census_tracts_2000"


#' chi_census_tracts_2010
#'
#' Spatial data containing boundaries for Chicago's 2010 census tracts.
#'
#' @format A SpatialPolygonsDataFrame with 5 slots and 801 Polygons:
#' \describe{
#'   \item{statefp10}{The state code for Illinois; 17}
#'   \item{countyfp10}{The county code for Cook; 31}
#'   \item{geoid10}{The 10 digit GEOID, e.g. 17031760803}
#'   \item{tractce}{The last 6 digits of geoid10, e.g. 17031760803}
#'   \item{name10}{Tract / block group, e.g. 7608.03}
#'   \item{namelsad10}{Tract / block group with "Census Tract", e.g. "Census Tract 7608.03"}
#'   \item{commarea_n}{Community area number (1-77)}
#'   \item{commarea}{identical to commarea_n}
#'   \item{notes}{Notes}
#'   ...
#' }
#' @source \url{https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Census-Tracts-2010/5jrd-6zik}
"chi_census_tracts_2010"



#' cook_dupage_tracts_2018
#'
#' Chicago census tracts for 2000
#'
#' @format A SpatialPolygonsDataFrame with 5 slots and 878 Polygons:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
#' @source \url{http://www.diamondse.info/}
"cook_dupage_tracts_2018"

#' cook_dupage_tracts_2018
#'
#' Chicago census tracts for 2000
#'
#' @format A SpatialPolygonsDataFrame with 5 slots and 878 Polygons:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
#' @source \url{http://www.diamondse.info/}
"cook_dupage_tracts_2019"








