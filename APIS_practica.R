library(plumber)
library(dplyr)
library(ggplot2)

#* @apiTitle Filtrados duracion peliculas
#* @apiDescription El usuario elige minutos y se le devuelven peliculas con menos minutos de los elegidos
#* @param min_duracion Tipo de duracion de la pelicula
#* @get /datos_filtrados


datos_filtrados <- function(min_duracion = 90) {
  datos <- read.csv("datosKNN.csv")
  datos$Minutes <- as.numeric(datos$Minutes)
  datos$title <- as.character(datos$title)
  min_duracion <- as.numeric(min_duracion)
  
  datos_nuevos <- datos %>% filter(Minutes > min_duracion) %>% select(title)
  
  return(datos_nuevos)
}

