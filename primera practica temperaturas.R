
###Práctica General###
a= seq(26, 40, by=0.10)
a
###Extraer temperaturas(Neiva, Aipe)
temNeiva<- sample(a, 7, replace = FALSE)
temNeiva

temAipe<- sample(a, 7, replace = FALSE)
temAipe

###Encabezados

vectorTemp<-c(temNeiva, temAipe)
vectorTemp

###Crear Matriz
###Primero se crea la matriz con los datos numéricos
temps = matrix(vectorTemp, byrow = T, nrow = 2)
temps

####Crear Encabezados filas(Neiva, Aipe) y 
###columnas(mon, tues, wed, thurs, fri, sat, sun)
dias = c("MON","TUES","WED","THURS","FRI", "SAT","SUN")
ciudades = c("Neiva","Aipe")

###Colocar nombres de columna y filas
colnames(temps)<-dias
row.names(temps)<-ciudades
temps

###Funciones Anexas
####Revisión completa de la matriz
summary(temps)
###Revisión Estructura tipos de datos
str(temps)
##Media por filas
rowMeans(temps)
###Media por columnas
colMeans(temps)
###Total por filas
rowSums(temps)
###Total por columnas
colSums(temps)
###Media de todo el dataset
mean(temps)
###Mediana por filas
median(temps[1,])
###Revisar datos repetidos
sort(table(temps[,1]), decreasing = TRUE)

###Agregar filas de Ibague
Ibague <- sample(a, 7, replace = F)
Ibague

temps2 <- rbind(temps, Ibague)
temps2

####Agregar columna promedio por filas
avg = c(rowMeans(temps2))
avg

temps2 = cbind(temps2, avg)
temps2

###Diagrama de Barras
barplot(avg, main="Temperaturas",  ylim = c(0,40),
        xlab = "Ciudades", ylab = "Nivel de Temperatura",
        names.arg=c("Neiva", "Aipe", "Ibagué"), 
        col=c("darkblue","red", "green"), beside = TRUE, 
        legend.text = rownames(temps2), 
        args.legend = list(x= 3, y=30, bty="n"),
        width = 0.6, xlim = c(0, 3.5), sub = "Ing. Julian Quimbayo")

###Diagrama torta / pie
pie(avg, main = "Temperaturas", col = rainbow(length(avg)))
legend("topright", c("Neiva","Aipe","Ibague"), cex = 0.8, fill =rainbow(length(avg)))


###Diagrama Torta 3d / pie3D
install.packages("plotrix")
library(plotrix)
lbl<-c("Neiva","Aipe","Ibague")

pie3D(avg, labels=lbl,explode=0.1, theta = 1)









