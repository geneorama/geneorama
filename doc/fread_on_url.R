
require(data.table)

dat <- fread("https://data.ny.gov/api/views/eda3-in2f/rows.csv")

## Business license (takes a long time)
# https://data.cityofchicago.org/resource/r5kz-chrr
system.time(dat <- fread("https://data.cityofchicago.org/api/views/r5kz-chrr/rows.csv"))
dim (dat)

## CRIME test (fails)
system.time(dat <- fread("https://data.cityofchicago.org/api/views/ijzp-q8t2/rows.csv"))


