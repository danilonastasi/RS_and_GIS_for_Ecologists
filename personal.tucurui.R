
library(raster)

setwd("C:/spatial_ecology/Downloads/tucurui")
vlist2011 <- list.files(pattern="LT05_L1TP_224063_20110729_20200820_02_T1_B")
vimport2011 <- lapply(vlist2011, raster)
tucurui2011 <- brick(vimport2011[[4]], vimport2011[[3]], vimport2011[[2]], vimport2011[[1]])
plotRGB(tucurui2011, r=2, g=3, b=4, stretch="lin")
plotRGB(tucurui2011, r=1, g=2, b=3, stretch="lin")
