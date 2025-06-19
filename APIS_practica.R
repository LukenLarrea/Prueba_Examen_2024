library(plumber)
library(dplyr)
library(ggplot2)

#* @apiTitle API para devolver los n titulos mas largos
#* @apiDescription El usuario elige cuantas peliculas quiere ver y se devuelven las mas largas
#* @param cantidad Peliculas a devolver
#* @get /datos_filtrados

datos_filtrados <- function(cantidad=10){
  datos <- read.csv("datosKNN.csv")
  cantidad <- as.numeric(cantidad)
  datos$Minutes <- as.numeric(datos$Minutes)
  
  peliculas <- datos %>% arrange(desc(datos$Minutes)) %>% select(Minutes,title) 
  return(head(peliculas,cantidad))
}

