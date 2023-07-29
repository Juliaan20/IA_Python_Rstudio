####Paso 1: Importar Student_mat ####
library(readr)
student_mat <- read_delim("C:/Users/ALIRIO QUIMBAYO/
                          OneDrive - corhuila.edu.co/Corhuila2021/
                          EvidenciasA2021/3. DesarrolloContenidos/
                          3. InteligenciaArtificial/8. Datasets/student-mat.csv", 
                          ";", escape_double = FALSE, trim_ws = TRUE)
###Paso 2: conversión ############
class(student_mat)

student <- as.data.frame(student_mat)

class(student)

###Paso 3: Limpieza de datos (is.na) - Outliers
any(is.na(student))

summary(student)

str(student)

###Paso 4: Incorporar librerías
library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)
library(caTools)

###Paso 5 Buscar Correlaciones
num.cols <- sapply(student, is.numeric)
num.cols

###Paso 6 Haciendo Correlaciones
cor.data<- cor(student[,num.cols])
cor.data

###Paso 7 Graficar las correlaciones
print(corrplot(cor.data, method = "number"))

corrgram(student, order = TRUE, lower.panel = panel.shade, upper.panel = panel.pie,
         text.panel = panel.txt)

###Paso 8 Revisar los datos en G3
ggplot(student, aes(G3))+ geom_histogram(bins = 20, alpha=0.5, fill="blue")

###Paso 9 particionar los datos 70% entrenar y 30% test
set.seed(101)
muestra <- sample.split(student$G3, SplitRatio = 0.7)
muestra

entrenar <- subset(student, muestra==TRUE)
entrenar

test<- subset(student, muestra==FALSE)
test

###Paso 10 Creación modelo de predicción
modelouno<- lm(G3~., data = student)

modelouno

summary(modelouno)

modelodos<- lm(G3~., data=entrenar)

summary(modelodos)

plot(modelouno)

plot(modelodos)

###Paso 11 Predicción:
g3.predicciones <- predict(modelodos, test)

resultados<- cbind(g3.predicciones, test$G3)

resultados

colnames(resultados)<-c('Futuro', 'Ahora')

resultados<- as.data.frame(resultados)

resultados












