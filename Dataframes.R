### Diferencia entre Matrices(Homogeneas) 
##y DataFrames(Heterogeneas)
producto <- c("Zumo","Queso","Yogurt")
seccion <- c("Bebidas","Productos Lacteos","Productos Lacteos")
unidades <- c(2,1,10)
###Crear Matriz con vectores por columnas
x<-cbind(producto, seccion, unidades)
x
###Revisando estructura
str(x)
###conversión de la matriz a dataframe
df<-as.data.frame(x)
df
###verificar si es dataframe o no?
class(df)
###Verificar estructura
str(df)
##Conversión texto o factor a numérico
df$unidades<- as.numeric(df$unidades)
df
###Revisión total de los elementos del dataframe
summary(df)

##################################
##Crear Secuencias
a<-seq(30,60, by=0.2)
a
###crear vectores conformar el dataframe
###Sembrar semilla para sostener los mismos resultados
set.seed(100)

temp<-c(sample(a,12,replace = F))

humedad<-c(sample(a,12,replace = F))

lluvias<-c(sample(a,12,replace = F))

mes<-c("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio",
       "Agosto","Septiembre","Octubre","Noviembre","Diciembre")

datos <- data.frame(mes=mes, temperatura=temp, humedad=humedad, lluvias=lluvias)
datos

################Operaciones del dataframe
##traigo las 6 primeras filas
head(datos)

###Traer las ultimas 6 filas
tail(datos)

##Summary
summary(datos)

#################Seleccionar datos
datos$temperatura

datos[1:3,]

datos[,1:3]

datos[,"humedad"]

datos[,c("humedad","lluvias")]

datos[1:3,2]

##############filtrar

subset(datos, datos$humedad==30.4 | datos$lluvias>40, select = c(mes))




