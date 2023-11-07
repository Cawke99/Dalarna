#Här ska vi göra R script Dalarna Kommun
library(sf)
library(mapview)
library(dplyr)


kommun_fil <- "C:/Users/sethb/Svag_is_2/svag_is_2/Dalarna_kommuner.shp"

dalarna_kommun <- st_read(kommun_fil, crs = 3006)

mapview(dalarna_kommun)

befolkn_fil <- "C:/Users/sethb/Svag_is_2/svag_is_2/bef_dalarna_23_70.csv"

befolkning <- read.csv(befolkn_fil, header = TRUE, sep = ";", dec = ".")

View(befolkning)
