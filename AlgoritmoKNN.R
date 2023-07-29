###PASO 1: IMPORTAR LOS DATOS .CSV
library(readr)
data <- read_csv("C:/Users/PC/OneDrive - corhuila.edu.co/Corhuila2021/EvidenciasA2021/3.DesarrolloContenidos/3. InteligenciaArtificial/8. Datasets/data.csv")
View(data)

###Eliminar columna fantasma
data <- data[,-33]

### Eliminar el ID
data<-data[, -1]

### Revisión del dataframe importado 
class(data)

### Conversión a dataframe
data <- as.data.frame(data)

###Paso 2 Estructura de datos

str(data)

table(data$diagnosis)

###Paso 3 Convertir a factor las clases de diagnóstico
data$diagnosis <- factor(data$diagnosis, levels = c("B", "M"), 
                         labels = c("Benigno","Maligno"))

str(data$diagnosis)

### Paso 4 Porcentaje de Benignos y Malignos
round(prop.table(table(data$diagnosis))*100, digits = 1)

### Paso 5 : Revisar summary

summary(data[c("radius_mean", "area_mean", "smoothness_mean")])

###Paso 6: Función Normalizar 0-1

normalizar <- function(x){
  return ((x-min(x))/ (max(x)-min(x)))
}

normalizar(c(1,2,3,4,5))

### Paso 7: Normalizar (569 datos)= 469 train 100 test

data2 <- as.data.frame(lapply(data[,2:31], normalizar))


summary(data2[c("radius_mean", "area_mean", "smoothness_mean")])

### Paso 8: Dataframe train & test
### Library catools sample.split

datatrain <- data2[1:469,]

datatest <- data2[470:569,]

trainlabels <- data[1:469,1]

testlabels <-data[470:569,1]

##Paso 9: Modelo KNN
install.packages("class")
library(class)
###Hallamos el valor de k del total de observaciones
sqrt(469)

dataclas<- knn(datatrain, datatest, cl=trainlabels, k=21)

### Paso 10: Evaluar el modelo (Matriz de Confusión)
install.packages("gmodels")
library(gmodels)
CrossTable(x= testlabels, y=dataclas, prop.chisq = FALSE)

### Paso 11: Mejora en el modelo
data3 <- as.data.frame(scale(data[-1]))

summary(data2[c("radius_mean", "area_mean", "smoothness_mean")])

summary(data3[c("radius_mean", "area_mean", "smoothness_mean")])

summary(data3$area_mean)


datatrain2 <- data3[1:469,]

datatest2 <- data3[470:569,]

trainlabels2 <- data[1:469,1]

testlabels2 <-data[470:569,1]




dataclas2<- knn(datatrain2, datatest2, cl=trainlabels2, k=21)

CrossTable(x= testlabels2, y=dataclas2, prop.chisq = FALSE)





