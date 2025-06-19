library(plumber)
library(dplyr)
library(ggplot2)

#* @apiTitle Normalizar o Estandarizar
#* @apiDescription El usuario elige entre normalizar y estandarizar y se le devuelve un histograma con la variable transformada
#* @param transformacion Tipo de transformación: "normalizar" o "estandarizar"
#* @get /histograma_transformado
#* @serializer png
histograma_transformado <- function(transformacion = "normalizar") {
  datos <- read.csv("datosKNN.csv")
  datos$Minutes <- as.numeric(datos$Minutes)
  
  if (tolower(transformacion) == "estandarizar") {
    datos$Minutes <- scale(datos$Minutes)
  } else {
    datos$Minutes <- (datos$Minutes - min(datos$Minutes, na.rm = TRUE)) / 
      (max(datos$Minutes, na.rm = TRUE) - min(datos$Minutes, na.rm = TRUE))
  }
  
  ggplot(datos, aes(x = Minutes)) +
    geom_histogram(fill = "navy", bins = 30) +
    theme_classic()
}


