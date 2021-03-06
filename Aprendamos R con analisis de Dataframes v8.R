
############################################
# APRENDIENDO R CON DATAFRAMES
# Diseñó: Ing. Luis Armando Amaya Q.
############################################
# importante crear un nuevo projecto
#cargar libreria para manejo de dataframes
library(readr)
library(dplyr)
library(ggplot2)
############################################
# Instalar librerias - ejemplo
########## ya las tengo instaladas
#install.packages("dplyr") # se instala 1 sola vez
#install.packages("ggplot2") # se instala 1 sola vez
#############################################
#############################################
### librerias para crear Modelo de regresion lineal en R
install.packages("tidyverse")
library(tidyverse)
install.packages("car")
library(car)
install.packages("boot")
library(boot)
install.packages("QuantPsyc")
library(QuantPsyc)
install.packages("ggplot2")
library(ggplot2)
############################################
# conocer el directorio o carpeta de trabajo actual
dir()
############################################
############################################
# Recordar que para leer un dataframe ya creado y almacenado en un sitio web
# se utiliza la siguiente instrucción
#X_df <- read.table(url, header=T)
## ver el siguiente ejemplo 
#Leer la base de datos medidas del cuerpo disponible en este
# enlace https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo. 
# Extraer de esta base de datos una sub-base o subconjunto que contenga sólo la edad, peso, altura y sexo de aquellos que miden más de 185 cm y pesan más de 80 kg.
url <- "https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo"
dt1 <- read.table(url, header=T)
dt1 # listar el contenido del dataframe dt1
################################
##################
# Recordar que para leer un dataframe ya creado se utiliza
#X_df <- read.table(url, header=T)
# También puede indicarle la ruta y parámetros de la siguiente forma
#datos<-read.csv(files="./carpeta/archivo.csv", header = TRUE, sep=",", dec=".")
# también, puedes leer el dataframe del directorio así:
#datos_df<-read.csv("./carpeta/archivo.csv")
#mi projecto esta en el directorio mis documentos/PROYECTO_R_ANALISIS_CAFE
#cafe_df<-read.csv("./produccioncafe.csv", header = TRUE, sep=",", dec=".")
#DATOS<-read_excel("./PRODUCCIONe.xlsx", header =TRUE)
cafe_df<-read.csv("./PRODUCCIONc.csv", header = TRUE, sep=",", dec=".")
cafe_df
class(cafe_df) # indica si es o no es un dataframe
class(cafe_df$Departamento)

class(cafe_df$Producto)
class(cafe_df$Rendimiento..ha.ton.)
class(cafe_df$Produccion..ton.)
###########################################################
# Creación de Vectores
# Creamos vectores con los valores
nombre <- c("Juan", "Margarita", "Ruben", "Daniel")
apellido <- c("Sanchez", "Garcia", "Sancho", "Alfara")
fecha_nacimiento <- c("1976-06-14", "1974-05-07", "1958-12-25", "1983-09-19")
sexo <- c("HOMBRE", "MUJER", "HOMBRE", "HOMBRE")
nro_hijos <- c(1, 2, 3, 4)
#####################################
# Creamos un dataframe con la ayuda de data.frame()
censo <- data.frame(nombre, apellido, fecha_nacimiento, sexo, nro_hijos)
# listar contenido del dataframe censo
censo
class(censo)
class(censo$nombre) #indica el tipo o clase de la variable nombre
class(censo$fecha_nacimiento) #indica el tipo o clase de la variable fecha nac
class(censo$nro_hijos) #indica el tipo o clase de la variable nombre
# A continuación podemos identificar la estructura del dataframe
str(censo)
#conocer la dimensión del dataframe
dim(censo)  # Para conocer la dimensión del dataframe - Nro filas y columnas
###########################################################
# Ahora, podemos ver la información resumen de todo el dataframe
# de las variables cuantitativas se tienen valores estadisticos
summary(censo)
summary(cafe_df)
# podemos tambien realizar el estudio por variables
summary(censo$nombre)
summary(censo$apellido)
summary(censo$nro_hijos)
# información del dataframe con varias variables
tapply(censo$nombre,censo$nro_hijos,summary)
###################################################
# tambien algunos valores estadísticos 
censo
max(censo$nro_hijos) # valor máximo de la variable
min(censo$nro_hijos) #valor mínimo de la variable
censo$nro_hijos #listar el contenido de la variable nro_hijos
sum(censo$nro_hijos) # sumar lo valores de la variable
prod(censo$nro_hijos) # el producto de lo valores de la variable
mean(censo$nro_hijos) #media o valor promedio de la variable
sd(censo$nro_hijos)  #desviación estándar de la variable
var(censo$nro_hijos) # varianza de la variable, es la desv estandar al cuad
length(censo$nro_hijos) # cantidad de valores almacenados en la varible
length(censo$nombre) # cantidad de valores almacenados en la varible
mean(cafe_df$Rendimiento..ha.ton.)
max(cafe_df$Rendimiento..ha.ton.)
min(cafe_df$Rendimiento..ha.ton.)
sd(cafe_df$Rendimiento..ha.ton.) 

################
#Las medidas de dispersion nos dicen 
#que tan parecidos o diferentes pueden llegar a ser
# nuestros dataset
max(cafe_df$Rendimiento..ha.ton.)-min(cafe_df$Rendimiento..ha.ton.)
##############################################################
#Ejemplo No.2
edad <- c(22, 34, 29, 25, 30, 33, 31, 27, 25, 25)
tiempo <- c(14.21, 10.36, 11.89, 13.81, 12.03, 10.99, 12.48, 13.37, 12.29, 11.92)
sexo <- c("M","H","H","M","M","H","M","M","H","H")
# Crear dataframe
Datosmuestra <- data.frame(edad,tiempo,sexo)
Datosmuestra
class(Datosmuestra) #indica si es o no es un dataframe
##########################################
#########################################
# Ejemplo No.3
# vectores sobre peliculas de Shrek
nombre <- c("Shrek", "Shrek 2", "Shrek 3", "Shrek: Felices por siempre")
puntuacion <- c(7.9, 7.2, 6.1, 6.3)
posterior_2010 <- c(FALSE, FALSE, TRUE, TRUE)
# crear dataframe 
peliculas_df <- data.frame(nombre,
               puntuacion,
               posterior_2010)
peliculas_df
class(peliculas_df)
class(nombre)
###########################################
# Estructura de los datos del dataframe
str(cafe_df)
str(censo)
str(Datosmuestra)
#La función str() nos muestra la estructura de este objeto, 
#confirmándonos que es un data.frame de tres variables con 
# 10 observaciones cada una. Nos informa además de que las dos primeras variables
# son numéricas y la tercera, el sexo, es un factor con dos valores, “H” y “M”. 
str(peliculas_df)
###############################################
# Nombre de las variables o columnas del dataframe
names(cafe_df)
names(censo)
colnames(censo)  # hace lo mismo que names
names(Datosmuestra)
names(peliculas_df)
###############################################
#Seleccion de variables o columnas
#Listar contenido del dataframe, parte inicial, final y por selección especifica
head(cafe_df)
head(censo)
tail(censo)
head(peliculas_df)
tail(peliculas_df)
censo[1:3,]
censo[3:6,]
censo[2:4,]
# asi podemos ir inspeccionando de forma detallada el dataframe
# Seleccionar solamente la columna 1 del dataframe censo
censo
censo[,1]
cafe_df[,1]

#seleccion de la columna 3
cafe_df[3]
cafe_df[1]
peliculas_df
peliculas_df[3]
peliculas_df[,3] # lista los valores de la columna 3 pero en una fila
cafe_df[,4]
peliculas_df[1:3,]
#seleccionar los datos de la segunda columna del Dataframe
Datosmuestra
Datosmuestra[,2] # lista los valores de la columna 2
peliculas_df
peliculas_df[,3]
#seleccionar los datos de la segunda columna del Dataframe
censo
censo[,2] #lista los valores de la segunda columna
censo[2,]  #lista los valores de la segunda fila del datafram
cafe_df[,2] #lista los valores de la columna 2
cafe_df[2,] #selección de los valores de la segunda fila
cafe_df[100,] #selección de los valores de la  fila 100
Datosmuestra
Datosmuestra[,2] #lista los valores de la columna 2
Datosmuestra[2,] #selección de los valores de la segunda fila
censo[,2]
peliculas_df[,2]
peliculas_df
#seleccionar los datos de la tercera columna del Dataframe
Datosmuestra
Datosmuestra[,3]
censo
censo[,3]
peliculas_df[,3]
peliculas_df
# Si se desea seleccionar algunas columnas
censo
# seleccion de las columnas 1,3,4
censo[c(1, 3, 4)]
peliculas_df[c(1,2,3)]
cafe_df[c(1,2,3)]
cafe_df[c(2,4,6)]
####################################################################
#podemos ELIMINAR filas del dataframe que se consideren no necesarias 
#Para eliminar filas definiremos un vector de tipo lógico en el que 
# indicaremos para cada fila si será eliminada o no:
# Definimos las filas a conservar, en este ejemplo las TRUE
# Creamos vectores con los valores, en este caso CENSO1
nombre <- c("Juan", "Margarita", "Ruben", "Luis")
apellido <- c("Sanchez", "Garcia", "Sancho", "Amaya")
fecha_nacimiento <- c("1976-06-14", "1974-05-07", "1958-12-25", "1983-09-19")
sexo <- c("HOMBRE", "MUJER", "HOMBRE", "HOMBRE")
nro_hijos <- c(1, 2, 3, 4)
# Creamos un dataframe con la ayuda de data.frame()
censo1 <- data.frame(nombre, apellido, fecha_nacimiento, sexo, nro_hijos)
# listar contenido del dataframe censo
censo1
filas_a_conservar <- c(TRUE, FALSE, TRUE, FALSE)
# Obtenenos un subconjunto de `censo` con las filas a conservar
filas_a_conservar
censo
censo1
# ahora mostramos el subconjunto del dataframe censo1
subconjunto_censo1 <- censo1[filas_a_conservar,]
subconjunto_censo1
# Mostramos por pantalla el `subconjunto_censo`
subconjunto_censo
################################################################
#Para AÑADIR filas a un `dataframe` existente, definiremos un nuevo vector respetando las variables
#de las columnas que han sido definidas con anterioridad y pegando esta fila al `dataframe` original
#mediante la función `rbind()` (acrónimo de _rowbind_, pegar por filas):
# Creamos vectores con los valores y el tipo de dato deseado
nombre <- c("Juan", "Margarita", "Ruben", "Daniel")
apellido <- c("Sanchez", "Garcia", "Sancho", "Alfara")
fecha_nacimiento <- as.Date(c("1976-06-14", "1974-05-07", "1958-12-25", "1983-09-19"))
sexo <- c("HOMBRE", "MUJER", "HOMBRE", "HOMBRE")
nro_hijos <- c(1, 2, 3, 4)
# Creamos un dataframe con la ayuda de data.frame()
censo3 <- data.frame(nombre, apellido, fecha_nacimiento, sexo, nro_hijos)
#listamos el dataframe censo3
censo3
str(censo3)
dim(censo3)
names(censo3)
censo3
# Añadir columna al dataframe
# Definimos una nueva fila
fila_nueva <- c("Oscar", "Gonzalez", "1989-07-15", "HOMBRE", 0, "ES")
# Añadimos la nueva fila a `censo` con `rbind()`
censo3 <- rbind(censo, fila_nueva)
# Mostramos por pantalla el dataframe `censo3`pero ahora con la nueva fila
censo3
####################################
#como unir dos dataframes
Df1 = data.frame (
   Cultivo = c("Trigo", "Melocoton", "Sandia", "Tomate", "Cebada"),
   Grupo = c("Cereal", "Frutal", "Horticola", "Horticola", "Cereal"))
Df2 = data.frame (
   Cultivo = c("Ciruelo", "Melocoton", "Sandia", "Tomate", "Trigo"),
   Agua = c("Regadio", "Regadio", "Regadio", "Regadio", "Secano"))
Df1 #listar contenido de Df1
Df2
#Unimos los DataFrames mediante el comando merge().
Df3<-merge (Df1, Df2, by = "Cultivo")
Df3
####################################################################
####################################################################
# continuamos con las seleccion de variables, para lo que necesite en el 
# analisis de los datos
#También podemos referirnos a la columna del Dataframe por su nombre si lo sabemos:
Datosmuestra$edad
# seleccion de datos por el nombre de las variables
censo
censo$nombre
censo$apellido
censo$fecha_nacimiento
cafe_df$Departamento
names(cafe_df)
cafe_df$Area..ha.
cafe_df$Produccion.Nacional..ton.
cafe_df$Anio
# tambien podemos utilizar la funcion table para listar el total(frecuencias) de cada columna
censo
table(censo$nombre)
table(censo$apellido)
table(censo$fecha_nacimiento)
table(censo$nro_hijos)
table(cafe_df$Produccion..ton.)
table(cafe_df$Rendimiento..ha.ton.)
censo[c('nombre', "sexo")]
censo[c('nombre', 'apellido', "fecha_nacimiento")]
peliculas_df
peliculas_df$nombre
peliculas_df$puntuacion
peliculas_df[c('nombre','puntuacion')]
#Seleccionando datos del Dataframe por fila y columna
# seleccion del dato de la fila 3 y columna 2
peliculas_df #listamos el dataframe
#seleccionar dato de la fila 3 y la columna 2
peliculas_df
#dataframe[fila,columna]
peliculas_df[3, 2]
datox32<-peliculas_df[3,2]
datox32
Datosmuestra[3,2]
# seleccionar dato de la fila 3 y la columna 2  por su nombre
peliculas_df[3, 'puntuacion']
peliculas_df[2, 'puntuacion']
peliculas_df[2, 2]
censo
censo[3,'nombre']
censo[4,'apellido']
# seleccionar más de un elemento del dataframe por RANGOS O FILAS
censo
#seleccion de la fila 3 las columnas 2 y 3
# y ademas, seleccion de la fila 4 y sus columnas 2 y 3
censo[ c(3,4), c(2,3)]
# otro ejemplo similar
#seleccion de las fila 1,2,3 las columnas 1 y 2
censo
censo[ c(1,2,3), c(1,2)]
cafe_df[ c(1,2,3), c(1,2)]
cafe_df[ c(10,20,30,40,50,60), c(1,2,3)]
# otro ejemplo similar
#seleccion de las fila 1,2,3 las columnas 1,2,3
censo
censo[ c(1,2,3), c(1,2,3)]
# otro ejemplo similar
#seleccion de la fila 4 las columnas 1,2,3,4
censo
censo[ c(4), c(1,2,3,4)]
##################################################
# Extraer subconjuntos de datos de un Dataframe
# se puede utilizar la función subset(x, subset, select)
# El parámetro x sirve para indicar el marco de datos o dataframe original
# el parámetro subset sirve para colocar la condición 
# el parámetro select sirve para quedarnos sólo con algunas de las variables
censo
# podemos pedir ayuda y comprender sobre los argumentos de esta funcion
help (subset)
subset(censo, subset=nombre == 'Juan')
subset(censo, subset=nombre == "Margarita")
subset(censo, subset=sexo == 'MUJER')
subset(censo, subset=sexo == 'HOMBRE')
###########################
names(cafe_df)
subset(cafe_df, subset = Departamento == 'HUILA')
subset(cafe_df, subset = Departamento == 'META')
subset(cafe_df, subset = Anio == '2009')
subset(cafe_df, subset = Anio == '2012')
names(censo)
subset(censo, subset=fecha_nacimiento >= '1970-01-01')
subset(censo, subset=fecha_nacimiento >= '1980-01-01')
subset(censo, subset=fecha_nacimiento <= '1980-01-01')
censo
subset(censo, subset=sexo =='MUJER', 
       select=c('nombre', 'apellido', 'fecha_nacimiento', 'nro_hijos'))
subset(censo, subset=fecha_nacimiento >= '1980-01-01', 
       select=c('nombre', 'apellido','nro_hijos'))
censo
subset(censo, subset=fecha_nacimiento >= '1980-01-01' & sexo =='HOMBRE')
subset(censo, subset=fecha_nacimiento <= '1980-01-01' & sexo =='HOMBRE')
subset(censo, subset=fecha_nacimiento <= '1980-01-01' & nro_hijos ==1)
subset(censo, subset=fecha_nacimiento <= '1980-01-01' & nro_hijos ==2)
subset(censo, subset=fecha_nacimiento >= '1980-01-01' & nro_hijos >2)
subset(censo, subset=fecha_nacimiento >= '1970-01-01' & nro_hijos >1)
subset(censo, subset=fecha_nacimiento >= '1970-01-01' & nro_hijos >3)
subset(censo, subset=fecha_nacimiento >= '1970-01-01' & sexo =='MUJER')
subset(censo, subset=fecha_nacimiento >= '1970-01-01' & sexo =='HOMBRE',
       select=c('nombre', 'apellido','nro_hijos'))
###############################
names(cafe_df)
subset(cafe_df, subset=Anio == '2009', 
       select=c('Rendimiento..ha.ton.', 'Produccion.Nacional..ton.'))
#############################
subset(cafe_df, subset=Departamento == 'CUNDINAMARCA', 
       select=c('Rendimiento..ha.ton.', 'Produccion.Nacional..ton.'))
##############
subset(cafe_df, subset=Departamento == 'CUNDINAMARCA' & Anio <= '2012', 
       select=c( 'Produccion.Nacional..ton.', 'Area.Nacional..ha.', 'Rendimiento..ha.ton.'))
#####################
##############
Grupo_Antioquia<-subset(cafe_df, subset=Departamento == 'ANTIOQUIA' & Anio <= '2012', 
       select=c( 'Produccion.Nacional..ton.', 'Area.Nacional..ha.', 'Rendimiento..ha.ton.'))
Grupo_Antioquia
plot(Grupo_Antioquia)
#################################################
#Podemos crear objetos nuevos (variables)
Grupo_nac_80<-subset(censo, subset=fecha_nacimiento >= '1980-01-01', 
       select=c('nombre', 'apellido','nro_hijos'))
# Mostrar el resultado
Grupo_nac_80
plot(Grupo_nac_80)
# nueva variable
Grupo_Homb_70<-subset(censo, subset=fecha_nacimiento >= '1970-01-01' & sexo =='HOMBRE',
       select=c('nombre', 'apellido','nro_hijos'))
Grupo_Homb_70
plot(Grupo_Homb_70)
# nueva variable
Grupo_Hom_80<-subset(censo, subset=fecha_nacimiento <= '1980-01-01' & sexo =='HOMBRE')
Grupo_Hom_80
plot(Grupo_Hom_80)
########################################
# Ordenacion de dataframes por variables
censo
#ordenar ascendente por nombre
censo[order(censo$nombre),]
nombre_asc<-censo[order(censo$nombre),]
nombre_asc
#ordenar ascendente por apellido
censo[order(censo$apellido),]
apellido_asc<-censo[order(censo$apellido),]
apellido_asc
#ordenar ascendente por Numero de hijos
censo[order(censo$nro_hijos),]
nro_hijos_asc<-censo[order(censo$nro_hijos),]
nro_hijos_asc
#ordenar ascendente por fecha de nacimiento
censo[order(censo$fecha_nacimiento),]
fecha_nac_asc<-censo[order(censo$fecha_nacimiento),]
fecha_nac_asc
# AHORA en orden DESCENDENTE
# funcion order (mayor a menor)
nro_hijos_desc<-censo[order(censo$nro_hijos,
                    decreasing = TRUE)]
nro_hijos_desc
apellido_desc<-censo[order(censo$apellido,
                     decreasing = TRUE)]
apellido_desc
#########################################################
# ahora vamos a observar los datos de manera detallada
# mediante el ciclo o bucle for se va a recorrer todo el dataframe
# ya que se va recorrer todas las filas y columnas del conjunto de datos
# se imprime el nombre de cada columna y sus datos y la frecuencia (cantidad)
# podemos ver además si hay datos perdidos al ver su frecuencia
#
 for (i in 1:dim(censo)[2])
 {
   print(colnames(censo)[i])
   print(table(censo[,i]))
  }
#######################################################
# podemos ver si existen datos NULOS en todo el dataframe censo
# si existen datos NULOS (NA), se tendrá la respuesta TRUE (TRUE equivale a 1)
is.na(censo)
is.na(peliculas_df)
is.na(Datosmuestra)
is.na(cafe_df)
# podemos ver si existen datos NULOS en en una columna del dataframe censo
is.na(censo$nombre)
is.na(censo$nro_hijos)
is.na(Datosmuestra$edad)
is.na(cafe_df$Area..ha.)
is.na(cafe_df$Rendimiento..ha.ton.)
# conocer por filas la suma de valores perdidos o nulos (NA)
rowSums(is.na(censo)) # si el valor es diferente de cero(0) hay datos nulos
rowSums(is.na(peliculas_df))
rowSums(is.na(Datosmuestra))
rowSums(is.na(cafe_df))
# ahora vamos a totalizar la cantidad de valores nulos o perdidos
sum(rowSums(is.na(censo)))
sum(rowSums(is.na(peliculas_df)))
sum(rowSums(is.na(Datosmuestra)))
sum(rowSums(is.na(cafe_df)))
# si son pocos podemos ver su contenido 
table(censo$nombre)
################################################
################################################
#Visualizacion de histogramas
Datosmuestra
hist(Datosmuestra$edad)
mean(Datosmuestra$edad)
##########
peliculas_df
hist(peliculas_df$puntuacion)
mean(peliculas_df$puntuacion)
#############
censo
hist(censo$nro_hijos)
mean(censo$nro_hijos)
hist(censo$fecha_nacimiento)
#####################3
# Realizar diagramas de barras
censo
# hallamos las frecuencias de los datos de la variable numero hijos
table(censo$nro_hijos)
# Diagrama de barras variable `nro_hijos`
barplot(table(censo$nro_hijos))
#####################
#####################
cafe_df
plot(cafe_df$Rendimiento..ha.ton.)
# ahora el mismo grafico pero con detalles
plot(cafe_df$Rendimiento..ha.ton., main ="Gráfico Dispersion", 
     sub ="CANTIDAD",
     type ="p", # p indica puntos de dispersion
     col ="red",
     xlab ="cantidad",
     ylab = "Rendimiento (ha/ton)")
#############
plot(cafe_df$Rendimiento..ha.ton., main ="Gráfico Dispersion", 
     sub ="Indices",
     type ="b", # b indica lineas uniendo los puntos de dispersion
     col ="red",
     xlab ="cantidad",
     ylab = "Rendimiento (ha/ton)")
##########
plot(cafe_df$Rendimiento..ha.ton., main ="Gráfico Dispersion", 
     sub ="Indices",
     type ="o", # b indica lineas sobreindicadas sobre los puntos de dispersion
     col ="blue",
     xlab ="cantidad",
     ylab = "Rendimiento (ha/ton)")
###########################
plot(cafe_df$Rendimiento..ha.ton., main ="Gráfico Dispersion", 
     sub ="Indices",
     type ="h", # b indica lineas tipo histograma sobre los puntos de dispersion
     col ="blue",
     xlab ="cantidad",
     ylab = "Rendimiento (ha/ton)")
##############
plot(cafe_df$Rendimiento..ha.ton., main ="Gráfico Dispersion", 
     sub ="Indices",
     type ="l", # l indica lineas 
     col ="blue",
     xlab ="cantidad",
     ylab = "Rendimiento (ha/ton)")
###############
plot(cafe_df$Rendimiento..ha.ton., main ="Gráfico Dispersion", 
     sub ="Indices",
     type ="s", # s funcion escalera (horizontal a vertical)
     col ="blue",
     xlab ="cantidad",
     ylab = "Rendimiento (ha/ton)")
##############
# graficos por variables
plot(x = cafe_df$Area..ha.,  y = cafe_df$Rendimiento..ha.ton.)
plot(x = cafe_df$Area..ha.,  y = cafe_df$Area.Nacional..ha.)
plot(x = cafe_df$ï..Year,  y = cafe_df$Rendimiento..ha.ton.)
plot(x = cafe_df$ï..Year,  y = cafe_df$Produccion..ton.)
plot(x = cafe_df$Area..ha.,  y = cafe_df$Produccion.Nacional..ton.)
plot(cafe_df$Area..ha.)
#########################
# Representar la frecuencia de los datos en un histograma
hist(cafe_df$Rendimiento..ha.ton., main ="Histograma", 
     sub ="Rendimiento (ha/ton)",
     col ="red",
     xlab ="Cantidad (miles) ",
     ylab = "Frecuencia")
# hallamos las frecuencias de los datos de la variable Rendimiento
table(cafe_df$Rendimiento..ha.ton.)
# diagrama de barras variable Rendimiento (ha/ton)
barplot(table(cafe_df$Rendimiento..ha.ton.))
#################################################
# datos estadisticos
cafe_df
summary(cafe_df$Rendimiento..ha.ton.)
summary(cafe_df$Produccion.Nacional..ton.)
summary(cafe_df$Area.Nacional..ha.)
#vamos a realizar el estudio de manera grafica la relacion entre dos variables
#obasevando su comportamiento en el diagrama de dispersion
plot(cafe_df$Produccion..ton.,cafe_df$Rendimiento..ha.ton.)
plot(cafe_df$Area..ha.,cafe_df$Rendimiento..ha.ton.)
plot(cafe_df$Area.Nacional..ha.,cafe_df$Rendimiento..ha.ton.)
#################
# Para ver como se distribuyen los datos, 
# podemos usar una funcion de densidad
#La densidad es una version suavizada del histograma
# Permite observar si los datos observados se comportan
# como una densidad conocida ejemplo: la distrib. normal.
plot(density(cafe_df$Rendimiento..ha.ton.), main="Densidad para el Rendimiento (ha/ton)")
# comparada con su el histograma que se da a continuacion
hist(cafe_df$Rendimiento..ha.ton., 
     main ="Histograma", 
     sub ="Rendimiento (ha/ton)",
     col ="red",
     xlab ="Cantidad en miles ",
     ylab = "Frecuencia")
################3
plot(density(cafe_df$Produccion.Nacional..ton.), main="Densidad para la produccion Nacional (ton)")
plot(density(cafe_df$Area.Nacional..ha.), main="Densidad para el Area Nacional (ha)")
###############
# Para  graficos tipo pie o pastel
pie(table(cafe_df$Departamento[1:10]))
pie(table(cafe_df$Rendimiento..ha.ton.[1:10]))
#######################
#Los Boxplots o diagramas de caja
#se construyen a partir de los percentiles.
# Se construye una rectangulo usando entre
#el primer y el tercer cuartil (Q1 y Q3)
#La altura del rectangulo es el rango intercuartil 
#La mediana es una linea que divide el rectangulo.
#Los valores mas extremos que el largo 
# de los brazos son considerados atipicos
# El boxplot nos entrega informacion sobre la simetria de la distribucion de los datos
# Si la mediana no esta en el centro del rectangulo, la distribucion no es simetrica
# Son utiles para ver la presencia de valores atipicos u outliers
boxplot(cafe_df$Rendimiento..ha.ton.,ylab="Rendimiento (ha/ton)")
boxplot(cafe_df$Produccion.Nacional..ton.,ylab="Produccion Nacional (ton)")
##### por rangos
boxplot(x=cafe_df$Rendimiento..ha.ton.[1:10],main="Rendimiento (ha/ton)")
####################################################
##################################################
# para mejorar la presentación y lectura de los graficos
### install.packages("hexbin") # solo se instala UNA VEZ
# cargar las funciones de la libreria
require(hexbin)
# tambien puedes usar:  library(hexbin)
# se crea el objeto bin con la relación de las dos variables
bin1<-hexbin(cafe_df$Produccion..ton.,cafe_df$Rendimiento..ha.ton., xbins=10)
plot(bin1)
########
bin2<-hexbin(cafe_df$Area.Nacional..ha.,cafe_df$Rendimiento..ha.ton., xbins=10)
plot(bin2)
##################
# hallar la correlacion entre las variables por correlacion de pearson
# indicamos que utiliza las variables con valores descartando los valores nulos que existan 
cor(cafe_df$Area.Nacional..ha.,cafe_df$Rendimiento..ha.ton., use="complete.obs")
#####################
# funciones en R
# Para crear funciones usamos la instrucción function,
suma<-function(a,b){
   a+b;
}
suma (100,200)
######
mult<-function(a,b){
   a*b;
}
mult (10,20)
#### Calculo del interés compuesto
interes<-function(va,vf, nper){
   ((vf/va)^(1/nper))-1
}
interes(10000,50000,18)
# Una forma de calcular la moda es utilizando funciones
# calcular la moda para la variable Rendimiento 
# en el dataframe Cafe
cafe_df
table(cafe_df$Rendimiento..ha.ton.)
moda=function(var){
   frec.var<-table(var)
   valor=which(frec.var==max(frec.var)) #Elemento con el valor
   names(valor)}
# ahora se llama a la función para que entregue el valor
moda(cafe_df$Rendimiento..ha.ton.)
#######################################
# graficos en 3D
###install.packages("scatterplot3d",dependencies=T)
#Luego se carga la libreria de la siguiente manera
library(scatterplot3d)
# desactivadas las siguientes 6 lineas, faltan AJUSTES
#plot(cafe_df$ï..Year, cafe_df$Rendimiento..ha.ton.,col=cafe_df$ï..Year,
#     pch=as.numeric(cafe_df$ï..Year)),
# Le agregamos una leyenda
# legend("topright", levels(cafe_df$Rendimiento..ha.ton.),
# lty=1, col=1:3, bty="n", cex=.75)
#########################################
# seguimos estudiando el comportamiento o distribución
# de los datos o la información con gráficos de dispersion
# Grafico de dispersion del comportamiento 
# de la producción versus Rendimiento
# permite entender o descubrir patrones en los datos
#install.packages("qplot")
qplot(Produccion..ton., Rendimiento..ha.ton., data = cafe_df,
      main ="Grafico de Dispersion",
      col = "Red",
      xlab ="Produccion (miles ton)",
      ylab = "Rendimiento (ha/ton)")
#################     
# Grafico de dispersion del comportamiento 
# de la producción nacional versus Rendimiento
# permite entender o descubrir patrones en los datos
qplot(Produccion.Nacional..ton., Rendimiento..ha.ton., data = cafe_df,
      main ="Grafico de Dispersion",
      col = "Red",
      xlab ="Produccion Nacional (miles ton)",
      ylab = "Rendimiento (ha/ton)")
################## coeficiente de correlacion de Pearson ######
# coeficiente de correlación entre La produc nacional y el rendimiento
# hallar la correlacion entre las variables por correlacion de pearson
# indicamos que utiliza las variables con valores descartando los valores nulos que existan 
cor(cafe_df$Produccion.Nacional..ton.,cafe_df$Rendimiento..ha.ton., use="complete.obs")
#####################
######################
# Grafico de dispersion del comportamiento 
# entre el Area nacional versus Rendimiento
# permite entender o descubrir patrones en los datos
qplot(Area.Nacional..ha., Rendimiento..ha.ton., data = cafe_df,
      main ="Grafico de Dispersion",
      col = "Red",
      xlab ="Area Nacional ha",
      ylab = "Rendimiento (ha/ton)")
################## 
# coeficiente de correlacion de Pearson
# coeficiente de correlación entre el area nacional y el rendimiento
# hallar la correlacion entre las variables por metodo correlacion de pearson
# indicamos que utiliza las variables con valores descartando los valores nulos que existan 
cor(cafe_df$Area.Nacional..ha.,cafe_df$Rendimiento..ha.ton., use="complete.obs")
#####################
qplot(Anio, Rendimiento..ha.ton., data = cafe_df,
      main ="Grafico de Dispersion",
      col = "Red",
      xlab ="Area Nacional ha",
      ylab = "Rendimiento (ha/ton)")
cor(cafe_df$Area.Nacional..ha.,cafe_df$Rendimiento..ha.ton., use="complete.obs")
##################################
#####  Graficando con la libreria ggplot #####
#install.packages("ggplot2") #Se instala 1 sola vez
library(tidyverse)
# Especificar el dataframe es el primer argumento en la función ggplot
# dentro de aes() escribimos las variables (x,y) que queremos graficar 
# permite entender o descubrir patrones en los datos
# se puede utilizar el parametro color para representar una tercera variable
# Gráfico de dispersion: Area Nacional vs Rendimiento
ggplot(cafe_df) + 
   geom_point(aes(x = Area.Nacional..ha., y = Rendimiento..ha.ton., color = Anio))
################
# Gráfico de lineas: Area Nacional vs Rendimiento
ggplot(cafe_df) + 
   geom_line(aes(x = Area.Nacional..ha., y = Rendimiento..ha.ton., color = Anio))
###################
# Gráfico de dispersion: Produccion Nacional vs Rendimiento
ggplot(cafe_df) + 
   geom_point(aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color = Anio))
################
###################
# Gráfico de lineas: Produccion Nacional vs Rendimiento
ggplot(cafe_df) + 
   geom_line(aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color = Anio))
################
# otra forma con grafico de lineas sin representar los años
#data(cafe_df)
ggplot(cafe_df, aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color ="red")) + 
   geom_line()
##################
# Histograma: Area Nacional 
ggplot(cafe_df) + 
   geom_histogram(aes(x = Area.Nacional..ha., color="red"))
################
# Histograma: Produccion Nacional
ggplot(cafe_df) + 
   geom_histogram(aes(x = Produccion.Nacional..ton., color="red"))
################
# Histograma: Rendimiento
ggplot(cafe_df) + 
   geom_histogram(aes(x = Rendimiento..ha.ton., color="red"))
################
# Gráfico de lineas: Produccion Nacional vs Rendimiento
ggplot(cafe_df) + 
   geom_line(aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color = Anio))
################
################
# Gráfico de cajas: Produccion Nacional vs Rendimiento
ggplot(cafe_df) + 
   geom_boxplot(aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color = Anio))
################
# Gráfico de cajas: Area Nacional vs Rendimiento
ggplot(cafe_df) + 
   geom_boxplot(aes(x = Area.Nacional..ha., y = Rendimiento..ha.ton., color = Anio))
#################
###################
################
# Gráfico de dispersion -jitter: Area Nacional vs Rendimiento
# análisis del comportamiento, dispersion mediante colores, agrupados por años
ggplot(cafe_df) + 
   geom_jitter(aes(x = Area.Nacional..ha., y = Rendimiento..ha.ton., color = Anio))
###################
# Gráfico de dispersion: Produccion Nacional vs Rendimiento
ggplot(cafe_df) + 
   geom_point(aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color = Anio))
################
# Gráfico de dispersion con jitter: Produccion Nacional vs Rendimiento
ggplot(cafe_df) + 
   geom_jitter(aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color = Anio))
#####################
# otra forma con grafico de dispersion sin representar los años
#data(cafe_df)
ggplot(cafe_df, aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color ="red")) + 
   geom_point()
# otra forma con grafico de lineas sin representar los años
#data(cafe_df)
ggplot(cafe_df, aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color ="red")) + 
   geom_line()
#comparando cuando tiene representado los años a continuacion
#data(cafe_df)
ggplot(cafe_df, aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color =Anio)) + 
   geom_line()
###############################
# tambien se puede realizar dispersion en PANELES por años
# permite entender o descubrir patrones en los datos
ggplot(cafe_df, aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton.)) + 
   geom_jitter() +
   facet_grid(.~ Anio)
################### ahora en paneles separados ##### 
# tambien se puede realizar dispersion en PANELES separados  por años
# permite entender o descubrir patrones en los datos
ggplot(cafe_df, aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton.)) + 
   geom_point() +
   facet_wrap(.~ Anio)
###################
# permite entender o descubrir patrones en los datos
ggplot(cafe_df, aes(x = Area.Nacional..ha., y = Rendimiento..ha.ton.)) + 
   geom_point() +
   facet_wrap(.~ Anio)
############
# GRAFICA DE DISPERSION - Produc Nacional versus Rendimiento
#Comparando el anterior con el grafico de dispersion sin años
# otra forma con grafico de dispersion sin representar los años
#data(cafe_df)
ggplot(cafe_df, aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color ="red")) + 
   geom_point()
#############################
# comparar con el Gráfico de dispersion  Produccion Nacional vs Rendimiento con años
ggplot(cafe_df) + 
   geom_jitter(aes(x = Produccion.Nacional..ton., y = Rendimiento..ha.ton., color = Anio))

##############################################
###############################################
#Grafica de dispersion del Área Nacional versus Producción Nacional
ggplot(cafe_df, aes(x = Area.Nacional..ha., y = Produccion.Nacional..ton., color ="red")) + 
   geom_point()
############################################
###############################################
#Grafica de dispersion del Área Nacional versus Producción Nacional
# mostrando comportamiento por años en tonalidades de azul
ggplot(cafe_df) + 
   geom_jitter(aes(x = Area.Nacional..ha., y = Produccion.Nacional..ton., color = Anio))
Grafica_AreaNal_ProdNal_2=ggplot(cafe_df) + 
   geom_jitter(aes(x = Area.Nacional..ha., y = Produccion.Nacional..ton., color = Anio))
Grafica_AreaNal_ProdNal_2
##############################################################
###############   MODELO DE REGRESION LINEAL EN R ############
#############################################################
#############################################################
#############################################################
### LIBRERIAS para crear Modelo de regresion lineal en R
# REcuerde, que se instalan una (1) vez (INSTALL), luego solo requiere llamar(LIBRARY)
#install.packages("tidyverse")
library(tidyverse)
#install.packages("car")
library(car)
#install.packages("boot")
library(boot)
#install.packages("QuantPsyc")
library(QuantPsyc)
#install.packages("ggplot2")
library(ggplot2)
########################################################
# construccion del modelo de regresion lineal, variable de entrada Area Nacional, Variable Salida Produc Nal
# CREAMOS EL MODELO DE REGRESIÓN LINEAL - PRODUC. NACIONAL VERSUS AREA NACIONAL
modelo_regresion_lineal=lm( Produccion.Nacional..ton.~ Area.Nacional..ha.,data=cafe_df, na.action=na.exclude)
#####################################
#####################################
# A continuación se describen los parámetros del modelo anterior
summary(modelo_regresion_lineal)
######################################
# Construcción de la gráfica Area Nal. versus Prod. Nacional 
Grafica_AreaNal_ProdNal_1=ggplot(cafe_df, aes(x = Area.Nacional..ha., y = Produccion.Nacional..ton., color ="red")) + 
   geom_point()
# a continuacion se despliega la grafica dispersion Area Nacional Versus Prod. Nac. 
Grafica_AreaNal_ProdNal_1
##########################################
##########################################
# MODELO DE REGRESION LINEAL - Area Nacional versus Producción Nacional
# Ahora se representa de dispersion con el modelo de regresión lineal en color azul
# la linea recta de color azul representa el modelo.
Grafica_AreaNal_ProdNal_1 + geom_point()+geom_smooth(method="lm", colour ="Blue")
########################################################
################################################################
###############################################
#Grafica de dispersion del Área Nacional versus Rendimiento
Grafica_AreaNal_Rendim_1=ggplot(cafe_df, aes(x = Area.Nacional..ha., y = Rendimiento..ha.ton., color ="red")) + 
   geom_point()
# a continuacion desplegamos la anterior grafica
Grafica_AreaNal_Rendim_1
############################################
## CREAMOS EL MODELO DE REGRESIÓN LINEAL DE RENDIMIENTO VERSUS AREA NACIONAL
modelo_regresion_lineal=lm( Rendimiento..ha.ton.~ Area.Nacional..ha.,data=cafe_df, na.action=na.exclude)
###############################################
#####################################
# A continuación se describen los parámetros del modelo anterior
summary(modelo_regresion_lineal)
######################################
###################################
###################################
# MODELO DE REGRESION LINEAL - Area Nacional versus Rendimiento
# Ahora se representa GRAFICA 2 con el modelo de regresión lineal en color azul
# la linea recta de color azul representa el modelo.
Grafica_AreaNal_Rendim_1 + geom_point()+geom_smooth(method="lm", colour ="Blue")
########################################################
################################################################
# Analisis de los datos mediante otros tipos de gráficas
# Ahora se utilizará un suavizador 
# la grafica lineal suavizada
# permite entender o descubrir patrones en los datos por años
ggplot(cafe_df, aes(x = Area.Nacional..ha., y = Rendimiento..ha.ton.)) + 
   geom_point() +
   facet_wrap(.~ Anio) +
   geom_smooth(span = 2)
############
# grafica general del dataframe cafe
ggplot(cafe_df)
########
ggplot(mpg) + 
   geom_point(aes(x = displ, y = hwy, color = class))
ggplot(mpg) + 
   geom_line(aes(x = displ, y = hwy, color = class))
#####################################################
### LIBRERIAS para crear Modelo de regresion lineal en R
# REcuerde, que se instalan una vez
install.packages("tidyverse")
library(tidyverse)
#install.packages("car")
library(car)
#install.packages("boot")
library(boot)
#install.packages("QuantPsyc")
library(QuantPsyc)
#install.packages("ggplot2")
library(ggplot2)
cafe_df
##########################