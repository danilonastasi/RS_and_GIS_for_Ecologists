
# R Version in use: 4.3.2 - 2023/10/31

###########    paragraph 3.1.2 ################
######  from the book "Remote Sensing and GIS for Ecologists" - Pelagic Publishing(2016) #####
######  revisited  #####

#### code ####

# set working directory where we stored files
setwd("C:/Users/danil/Documents/esercitazioniR")

library(sp)
# download data csv sample from 
# https://gist.github.com/bigwestern/1c563bc1e389ea8eea711c4435b01306
# move the file to the working directory
gps_in <- read.csv("sample-marks-of-field-trip-with-j-birrell.csv")
head(gps_in)
summary(gps_in)
plot(gps_in)

# eels <- read.csv("landsat_tm_c2_l1_65724d0b5b92cf1.csv", sep = ",", header = FALSE)
eels <- read.csv("landsat_tm_c2_l1_6571f99e3ee92d9c.txt", sep = ",", header = TRUE , fileEncoding="latin1")

### to test, it does not work with csv landsata data, we should clean ###
### this csv file, converting probably in a data frame ###
ggplot(subset(eels, WRS.Row  < 63 & Land.Cloud.Cover < 20)) +
geom_tile(aes(x = Land.Cloud.Cover, y = WRS.Row, alpha = Land.Cloud.Cover, fill = 
              Satellite), width = 2, linewidth = 2) +
scale_alpha_continuous(name = "Land.Cloud.Cover ", range = c(1, 0.5))

ggplot(data = eels, mapping = aes(x = Land.Cloud.Cover, y = WRS.Row)) +
geom_point()

for (x in 1:960) {
   if (eels$Land.Cloud.Cover[x] < 3) {
      print(eels[x, 1:4]) }
}


### let's try to plot like in the book example, using a data frame penguins ###
# install.packages("tidyverse")
library(tidyverse)

# install.packages("palmerpenguins")
library(palmerpenguins)

# install.packages("ggthemes")
library(ggthemes)

penguins
glimpse(penguins)

ggplot(subset(penguins, year < 2023 & flipper_length_mm > 120)) +
geom_tile(aes(x = flipper_length_mm, y = year, alpha = flipper_length_mm, fill = 
              species), width = 1, linewidth = 1) +
scale_alpha_continuous(name = "flipper_length_mm ", range = c(1, 0.5))


  
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

# rgdal package is not working anynmore:
# https://www.r-bloggers.com/2023/06/upcoming-changes-to-popular-r-packages-for-spatial-data-what-you-need-to-do/
# library(rgdal) becomes: 
library(sf)
setwd("C:/Users/danil/Documents/esercitazioniR")
# studyarea <- readOGR("vector_data/", "study_area_11") becomes:
studyareasf <- read_sf("sample-marks-of-field-trip-with-j-birrell.csv")
# or
library(terra)
studyareaterra <- vect("sample-marks-of-field-trip-with-j-birrell.csv")

########### book: RS and GIS for Ecologists - paragraph 3.2.1 ################
###########                                                   ################

# exporting, from USGS, landsat results 2001-2011 as a comma separated value file, zip file, txt file, saving in our drive:

zipfiles <- list.files(path = "C:/Users/danil/Downloads/landsat/usgsexport", pattern = ".zip", full.names = TRUE)
# unzip:
eeResults <- lapply(zipfiles, unzip, exdir = "C:/Users/danil/Downloads/landsat/usgsexport")

# eedatatable <- read.table("C:/Users/danil/Downloads/landsat/usgsexport/landsat_tm_c2_l1_6571f99e3ee92d9c.txt", sep=",", header=FALSE)
# read.table looks similar result with read.csv

eedatacsv <- read.csv("C:/Users/danil/Downloads/landsat/usgsexport/landsat_tm_c2_l1_6571f99e3ee92d9c.txt", sep=",", header = TRUE , fileEncoding="latin1")
head(eedatacsv,10)  # let's show the first 10 rows


########### book: RS and GIS for Ecologists - paragraph 3.3.2 ################
###########                                                   ################

# using OpenStreetMap package
# https://cran.r-project.org/web/packages/osmdata/index.html

# first option (not recommended in this case)
library(osmdata)
library(tidyverse)
library(sf)

town <- 'London' 
location <- town %>% opq()

# second option (recommended)
coords <- matrix(c(-0.1,-0.07,51.5,51.52), byrow = TRUE, nrow = 2, ncol = 2, dimnames = list(c('x','y'),c('min','max'))) 
location <- coords %>% opq()









