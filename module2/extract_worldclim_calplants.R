library(raster)

calplants = read.csv("GBIF_California.csv",sep = '\t')
bios<-getData(name = "worldclim",path = "~/",res=2.5,var='bio')

x=calplants$decimalLongitude
y=calplants$decimalLatitude
xy<-cbind(x,y)
calclim<-raster::extract(bios,xy)

write.csv(file = "GBIF_California_clim.csv",calclim)


