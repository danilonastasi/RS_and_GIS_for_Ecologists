
# studying difference around Tucurui, Latin America, between 2001 and 2011

library(raster)

# set working directory where we stored files
setwd("C:/spatial_ecology/Downloads/tucurui")

# data in this code were get from the websire:
# https://earthexplorer.usgs.gov/
# 29/07/2011 and 02/08/2001 -  data set Landsat 4-5 TM C2 L1
# Path: 224 Row: 063

vlist2011 <- list.files(pattern="LT05_L1TP_224063_20110729_20200820_02_T1_B") # we list 7 bands
vlist2001 <- list.files(pattern="LT05_L1TP_224063_20010802_20200905_02_T1_B")
# band 1 blue
# band 2 green
# band 3 red
# band 4 Near-Infrared (0.76 - 0.90 µm) 
# band 5 Near-Infrared (1.55 - 1.75 µm) 30 m
# band 6 thermal
# band 7 Mid-Infrared (2.08 - 2.35 µm)

vimport2011 <- lapply(vlist2011, raster) # we import 7 bands
vimport2001 <- lapply(vlist2001, raster)

# let's create a RasterBrick object with band 4, 3, 2, 1
tucurui2011 <- brick(vimport2011[[4]], vimport2011[[3]], vimport2011[[2]], vimport2011[[1]])
tucurui2001 <- brick(vimport2001[[4]], vimport2001[[3]], vimport2001[[2]], vimport2001[[1]])
plotRGB(tucurui2011, r=2, g=3, b=4, stretch="lin") # natural colours
plotRGB(tucurui2011, r=1, g=2, b=3, stretch="lin") # false colours with near infrared in the position of red
plotRGB(tucurui2001, r=2, g=3, b=4, stretch="lin")
plotRGB(tucurui2001, r=1, g=2, b=3, stretch="lin")
par(mfrow=c(2,2))
plotRGB(tucurui2001, r=2, g=3, b=4, stretch="lin")
plotRGB(tucurui2011, r=2, g=3, b=4, stretch="lin") # natural colours
plotRGB(tucurui2001, r=1, g=2, b=3, stretch="lin")
plotRGB(tucurui2011, r=1, g=2, b=3, stretch="lin") # natural colours


