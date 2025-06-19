# Carga de librerías necesarias
library(plumber)
library(ggplot2)

#* @apiTitle API para transformación y visualización de 'Minutes'
#* @apiDescription Según el parámetro indicado, aplica transformación logarítmica a la variable 'Minutes' y devuelve un histograma.

#* Devuelve un histograma de 'Minutes' con o sin transformación logarítmica
#* @param transformacion Indica si se aplica transformación logarítmica: "si" o "no"
#* @get /histograma_minutes
#* @serializer png
function(transformacion = "no") {
  # Cargar datos
  datos <- read.csv("datosKNN.csv")
  
  # Asegurar que Minutes es numérica
  datos$Minutes <- as.numeric(datos$Minutes)
  
  # Transformar si el parámetro lo pide
  if (tolower(transformacion) == "si") {
    datos$Minutes <- log(datos$Minutes)
    titulo <- "Histograma (log(Minutes))"
  } else {
    titulo <- "Histograma (Minutes)"
  }
  
  # Crear histograma con ggplot2
  histograma <- ggplot(datos, aes(x = Minutes)) +
    geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
    labs(title = titulo, x = "Minutes", y = "Frecuencia") +
    theme_minimal()
  
  # Devolver imagen
  print(histograma)
}
