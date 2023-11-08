#Här ska vi göra R script Dalarna Kommun
# ska lägga till demografi


library(tidyverse)
library(sf)
library(mapview)
library(dplyr)


kommun_fil <- "Dalarna_kommuner.shp"

dalarna_kommun <- st_read(kommun_fil, crs = 3006)

mapview(dalarna_kommun)

# Buffer ska vara över dalarna men blev kommunvis #######
dalarna_buffer <- st_buffer(dalarna_kommun, 30000)

mapview(dalarna_buffer)


# Fortsätter här när vi har en tabell som vi kan joina

bilinnehav_fil <- "bilinnehav_2.csv"
# 
bilinnehav <- read.csv(bilinnehav_fil, header = TRUE, sep = ";", dec = ".")

bilinnehav <- bilinnehav %>% 
  mutate(kom_kod = substr(X, 1, 4))

bilinnehav <- bilinnehav %>%
  mutate(kommun = if_else(nchar(X) > 4, 
                 substr(X, 5, 
                        nchar(X)), 
                 ""))



bilinnehav <- bilinnehav %>%
  rename(ingen_bil = Har.ej.personbil.i.trafik, en_bil = Har.1.personbil.i.trafik, tva_bil = Har.2.personbilar.i.trafik)

view(bilinnehav)
##############
bilinnehav <- bilinnehav %>% rename(KOM_KOD = kom_kod)

library(dplyr)
result <- full_join(dalarna_kommun, bilinnehav, by = "KOM_KOD")



