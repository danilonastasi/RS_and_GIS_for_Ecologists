
library(raster)

# set working directory where we stored files
setwd("C:/spatial_ecology/Downloads/tucurui")

# data in this code were get from the websire:
# https://earthexplorer.usgs.gov/
# 29/07/2011 data set Landsat 4-5 TM C2 L1
# Path: 224 Row: 062

vlist2011 <- list.files(pattern="LT05_L1TP_224063_20110729_20200820_02_T1_B") # we list 7 bands
# band 1 blue
# band 2 green
# band 3 red
# band 4 Near-Infrared (0.76 - 0.90 µm) 
# band 5 Near-Infrared (1.55 - 1.75 µm) 30 m
# band 6 thermal
# band 7 Mid-Infrared (2.08 - 2.35 µm)

vimport2011 <- lapply(vlist2011, raster) # we import 7 bands

# let's create a RasterBrick object with band 4, 3, 2, 1
tucurui2011 <- brick(vimport2011[[4]], vimport2011[[3]], vimport2011[[2]], vimport2011[[1]])
plotRGB(tucurui2011, r=2, g=3, b=4, stretch="lin") # natural colours
plotRGB(tucurui2011, r=1, g=2, b=3, stretch="lin") # false colours with near infrared in the position of red
