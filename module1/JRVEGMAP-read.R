library(sf)
library(rgdal)
# define the path to the kml, once unziped from kmz inthe command line
pathkml<-"~/bio224/Computerclass1/doc.kml"
# see the available layers, there are 1/14 habitats
ogrListLayers(pathkml)
habitats<-ogrListLayers(pathkml)[1:14]
# read all 14 habitats
jrall<-lapply(habitats, function(i) readOGR(pathkml,layer =i))
plot(jrall[[1]]) # example plot one
# combine them 
jrcombined<-rbind(jrall[[1]], jrall[[2]],jrall[[3]],jrall[[4]],jrall[[5]],jrall[[6]],jrall[[7]],jrall[[8]],jrall[[9]],jrall[[10]],jrall[[11]],jrall[[12]],jrall[[13]],jrall[[14]])
plot(jrcombined)

# Area of Redwood
sum(area(jrall[[which(habitats=="Redwood Forest")]]))
# Area of leather oak (there is also grassland that we can get)
sum(area(jrall[[which(habitats=="Leather Oak Chaparral")]]))
