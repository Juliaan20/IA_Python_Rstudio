##Instalar Libreria ISLR
install.packages("ISLR")
library(ISLR)
Caravan

###Paso 1: Tomar las etiquetas

labels <- Caravan[, 86]

### Paso 2: Revisar los datos
summary(Caravan[,1])
summary(Caravan[,2])

### Paso 3: Normalizar
data <- scale(Caravan[,-86])

summary(data[,1])
summary(data[,2])

###Paso 4: Datos train y test

test.index <- 1:1000
test.data <- data[test.index,]
test.labels <- labels[test.index]

####Datos Train

train.data <- data[-test.index, ]
train.labels <- labels[-test.index]


##Paso 5: Modelo y matriz de confusión

library(class)

sqrt(409870)

class.purchase <- knn(train.data, test.data, train.labels, k=5)

library(gmodels)

CrossTable(test.labels, class.purchase, prop.chisq = FALSE)


