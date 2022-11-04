## CLASE 04/11/2022
## Alejandra Montes de Oca Calero
## Nº exp. 22013334
## Lenguajes de Progrmaación Estadística


# CARGAMOS LIBRERÍAS ------------------------------------------------------
install.packages(c("tidyverse","httr","janitor","magrittr"))
library(tidyverse)
library(httr)
library(janitor)
library(magrittr)


# ESCRIBIR Y LEER FICHEROS/ARCHIVOS ---------------------------------------

## Sacamos la url de las gasolineras mediante el link.
url <- "https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/"
f_raw <- jsonlite::fromJSON(url)

# Guardamos los datos en un dataframa.
df <- f_raw$ListaEESSPrecio %>% as_tibble() %>% glimpse()

## Prcoedmos con la limpieza de los nombres de df y lo guardamos en uno nuevo.
df2 <- df %>% janitor::clean_names() %>% type_convert(locale = locale(decimal_mark = ",")) %>% glimpse()

## Como se pidió, procedemos mediante el uso de expresiones regulares a diferenciar las gasolineras que son franquicia.
## Se supone que estas tiene S.A. o S.L. en el rotulo.
df2 %<>% tidyr::extract(rotulo, c("extension"), "(S\\.L|S\\.A|\\bSL\\b|\\bSA\\b)", remove = F) %>%mutate(marca_franquicia = extension %in% c("SL", "SA", "S.A", "S.L"))

df2$marca_franquicia <- plyr::mapvalues(df2$marca_franquicia, from = c("TRUE", "FALSE"), to = c("FRANQUICIA", "MARCA"), warn_missing = F)
df2 %>% view()
