###Paso 1: Importar el dataset###
library(readr)
kc_house_data <- read_csv("C:/Users/ALIRIO 
                          QUIMBAYO/OneDrive - corhuila.edu.co
                          /Corhuila2021/EvidenciasA2021/3. DesarrolloContenidos/
                          3. InteligenciaArtificial/8. Datasets/kc_house_data.csv")

###Conversión de lista a dataframe
class(kc_house_data)

kc_house_data<-as.data.frame(kc_house_data)
###Mantener el dataframe atado y solo llamar variables o columnas
attach(kc_house_data)

###Paso 2: Buscar Correlaciones any(is.na(kc_house_data))
pairs(kc_house_data[,3:6])

cor.data<- cor(kc_house_data[,3:6])
cor.data

library(corrplot)
print(corrplot(cor.data, method = "number"))

library(corrgram)
corrgram(kc_house_data[,3:6], order = T, lower.panel = panel.shade,
         upper.panel = panel.pie, text.panel = panel.txt)

cor(sqft_living, price)

###paso 3 Datos de entrenamiento y Testing
library(dplyr)
library(caTools)

muestra <- sample.split(price, SplitRatio = 0.7)
muestra

entrenar <- subset(kc_house_data, muestra==T)
entrenar

test <- subset(kc_house_data, muestra == F)
test

###Paso 4: Creación del Modelo
modelo <- lm(price ~ sqft_living, data=kc_house_data)
summary(modelo)

modelodos <- lm(price ~ sqft_living, data = entrenar)
summary(modelodos)

###Paso 5: Graficar el modelo
plot(sqft_living, price, main="Modelo de regresión lineal dos",
     xlab="Superficie de Hogar", ylab = "Precio Casa")
abline(modelodos, col="green")

###Comprobación del modelo como predice
y = b+mx
y = -64342.386 + 292.191 * 2000
y

boxplot(sqft_living)
boxplot(price)

predict(modelodos, data.frame(sqft_living=2000))








