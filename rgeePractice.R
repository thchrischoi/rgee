
## rgeePractice.R


## Chrisopher Tsz Hin Choi
## Natural Resource Ecology Laboratory
## Christopher.Choi@colostate.edu

## 05/31/2022


## Practicing some rgee by following this tutorial:
## https://www.youtube.com/watch?v=SHXuIpjU3YE&ab_channel=ISPRSSC


library(rgee)
library(dplyr)

## Install GEE environment 

## Load world SRTM data
srtm = ee$Image("CGIAR/SRTM90_V4")

## Check meta data
ee_print(srtm)


## map srtm layer
Map$addLayer(eeObject = srtmn, name = 'srtm')

## create vis-paramas for srtm data
vis_srtm = list(
  bands = 'elevation',
  min = 1000,
  max = 3000
)

## map srtm layer with vis params
Map$addLayer(eeObject = srtm, visParams = vis_srtm, name = 'srtm')



## cenetering and zooming map
Map$setCenter(lon = -105.0844, lat = 40.5853, zoom = 8)
Map$addLayer(eeObject = srtm, visParams = vis_srtm, name = 'srtm')



## caluclate slop of elevation
slope = ee$Terrain$slope(srtm)
ee_print(slope)
Map$addLayer(eeObject = slope, visParams = list(min = 0, max =1), name = 'slope')


## Community Datasets
# https://github.com/samapriya/awesome-gee-community-datasets



### Image Collection


trmm = ee$ImageCollection("TRMM/3B43V7")
ee_print(trmm)

# get TRMM precipitation data 
# obs: note the pipes %>% to connect the commands
trmm = ee$ImageCollection("TRMM/3B43V7") %>%
  ee$ImageCollection$filterDate("2001-01-01", "2002-01-01") %>% 
  ee$ImageCollection$map(function(x) x$select("precipitation")) %>% # Select only precipitation bands
  ee$ImageCollection$toBands() %>% # from imagecollection to image
  ee$Image$rename(sprintf("%02d",1:12)) # rename the bands of an image

Map$setCenter(lon = -105.0844, lat = 40.5853, zoom = 3)
Map$addLayer(trmm)
