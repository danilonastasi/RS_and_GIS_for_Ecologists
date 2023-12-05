
# R Version in use: 4.3.2 - 2023/10/31

# precipitation in Italy
#### code ####

#### let us download the vector outline of the administrative boundaries of ITA ####

# install.packages("raster")
library(raster)
italy <- getData("GADM", country = "ITA", level = 1) # getDATA allows you to query 
                                                      # several freely spatial data sets
                                                      # for example from the Global Administrative
                                                      # (GADM) database
plot(italy)
x <- getData("ISO3")
x[x[, "NAME"] == "South Africa", ]
x

#### download the precipitation data from WorldClim ####
prec <- getData("worldclim", var = "prec", res =2.5)
prec

# let's crop in order to show data just for Italy
ext <- c(6, 19, 35, 48)
italycrop <- crop(prec, ext)
italycrop
plot(italycrop)
names(italycrop) <- c("Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec")
plot(italycrop)
cl <- colorRampPalette(c("orange", "lightblue", "blue")) (100)
plot(italycrop,col=cl)

par(mfrow=c(1,2))
plot(italycrop, col=cl, 10) # October
plot(italycrop, col=cl, 11) # November

# let's try with Sicily
extsic <- c(12, 16, 35, 39)
siccrop <- crop(prec, extsic)
plot(siccrop,col=cl)


