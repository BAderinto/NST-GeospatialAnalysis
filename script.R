library(tidyverse)
library(pins)
library(sp)
library(sf)
library(raster)
#library(rgdal)
library(tmap)      # Easy way of producing maps
library(spatialEco)
library(terra)
library(janitor)
library(googlesheets4)


# No need for authentication
gs4_deauth()

data <- read_sheet("https://docs.google.com/spreadsheets/d/1_QY-l4xhMu5nZVluprOgRs6rUzgkkBemapdsg5lFzKU/pub?output=xlsx")%>% 
  dplyr::select(-c(49)) %>% clean_names()

# July 08, 2022
no_of_rows <- data %>% nrow()
  
display_result <- paste("The total number of rows", Sys.Date(), "is:", no_of_rows)


write_csv(data,paste0('data/',Sys.Date(),'_nst_jc_data','.csv'))    


# Missing values
# perpetrators <- data[, 7:15] %>%
#   dplyr::mutate(across(.cols = everything(), ~ if_else(is.na(.x), 0, 1)))
# 
# victims <- data[, 16:27] %>%
#   dplyr::mutate(across(.cols = everything(), ~ if_else(is.na(.x), 0, .x)))
# 
# weapons <- data[, 28:33] %>%
#   dplyr::mutate(across(.cols = everything(), ~ if_else(is.na(.x), 0, 1)))
# 
# venues <- data[, 34:40] %>%
#   dplyr::mutate(across(.cols = everything(), ~ if_else(is.na(.x), 0, 1)))
# 
# sources <- data[, 41:44] %>%
#   dplyr::mutate(across(.cols = everything(), ~ if_else(is.na(.x), "Not Available", .x)))
# 
# # Bind the data frames to data[,1:6]
# data <-
#   bind_cols(data[, 1:6], perpetrators, victims, weapons, venues, sources)
# 
# data <- data[which(!is.na(data$Date)),]
# 
# data <- data %>%
#   mutate(Year = lubridate::year(Date))


