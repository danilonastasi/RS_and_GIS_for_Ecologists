
# R Version in use: 4.3.2 - 2023/10/31

# book: RS and GIS for Ecologists - paragraph 3.1.2 
#### code ####

#### let us download the vector outline of the administrative boundaries of Brazil ####

# install.packages("raster")
library(raster)
brazil <- getData("GADM", country = "BRA", level = 1) # getDATA allows you to query 
                                                      # several freely spatial data sets
                                                      # for example from the Global Administrative
                                                      # (GADM) database
plot(brazil)
x <- getData("ISO3")
x[x[, "NAME"] == "South Africa", ]
x


#### download the precipitation data from WorldClim ####

# https://rdrr.io/cran/raster/man/getData.html
# 'worldclim' is a database of global interpolated climate data: precipitation, temperature, bio, 
prec <- getData("worldclim", var = "prec", res =2.5)
prec
names(prec) <- c("Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec")
prec
plot(prec)
plot(prec, 1) # January


#### Package ‘rgdal’ was removed from the CRAN repository.
#### Archived on 2023-10-16 at the request of the maintainer. 
#### Consider using 'sf' or 'terra' instead.
# st_read: Read simple features or layers from file or database

# library(rgdal) becomes:
library(sf)
# studyarea <- readOGR("vector_data/", "study_area_11") becomes:
studyarea <- st_read("c:...filepath")





