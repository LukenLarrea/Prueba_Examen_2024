library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)

datos <- read.csv("netflix.csv")

#Data Discovering
exploracion <- datos[,10:11]
summary(exploracion)
sd(exploracion$Minutes,na.rm = T)
sd(exploracion$Seasons,na.rm = T)

sum(table(unique(datos$type)))
sum(table(unique(datos$country)))
sum(table(unique(datos$director)))

#Data Cleaning
miss_case_summary(datos)
miss_var_summary(datos)

vis_miss(datos)

#Tratamiento de NAS
KNN <- kNN(datos,variable = c("Minutes","Seasons"))
countNA(KNN$Minutes)
countNA(KNN$Seasons)
