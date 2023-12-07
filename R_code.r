
# R Version in use: 4.3.2 - 2023/10/31

########### book: RS and GIS for Ecologists - paragraph 3.1.2 ################
###########                                                   ################

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

########### book: RS and GIS for Ecologists - paragraph 3.2.1 ################
###########                                                   ################

# exporting, from USGS, landsat results 2001-2011 as a comma separated value file, zip file, txt file, saving in our drive:

zipfiles <- list.files(path = "C:/Users/danil/Downloads/landsat/usgsexport", pattern = ".zip", full.names = TRUE)
# unzip:
eeResults <- lapply(zipfiles, unzip, exdir = "C:/Users/danil/Downloads/landsat/usgsexport")

# eedatatable <- read.table("C:/Users/danil/Downloads/landsat/usgsexport/landsat_tm_c2_l1_6571f99e3ee92d9c.txt", sep=",", header=FALSE)
# read.table looks similar result with read.csv

eedatacsv <- read.csv("C:/Users/danil/Downloads/landsat/usgsexport/landsat_tm_c2_l1_6571f99e3ee92d9c.txt", sep=",", header=FALSE)
head(eedatacsv,10)  # let's show the first 10 rows


# temp, to test #
ggplot(subset(eedatacsv, path = 224 & row = 63 & Cloud Cover < 20)) +
   geom_tile(aes(x = Doy, alpha = Cloud Cover,
                 fill = Satellite), width = 2, size = 2) +
   scale_y_continuous(breaks = c(2001:2011)) +
   scale_alpha_continuous(name = "Cloud Cover (%)", range = c(1, 0.5))


