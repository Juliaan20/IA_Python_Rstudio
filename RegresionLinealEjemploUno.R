####paso 1 Importaci�n Dataset####
library(readr)
student_mat <- read_delim("C:/Users/ALIRIO QUIMBAYO/OneDrive - 
                          corhuila.edu.co/Corhuila2021/EvidenciasA2021/
                          3. DesarrolloContenidos/3. InteligenciaArtificial/
                          8. Datasets/student-mat.csv", 
                          ";", escape_double = FALSE, trim_ws = TRUE)
View(student_mat)

###Paso 2 Estructura ####
str(student_mat)
##student_mat<- as.character(student_mat$G3) -> conversi�n

class(student_mat)

###Conversi�n dataframe ####
df <- as.data.frame(student_mat)
df

class(df)

####Paso 3 Revisar Inconsistentes (Outliers)####
any(is.na(df))

str(df)

###Paso 4 Cargar Librer�as ####
install.packages('ggplot2')
install.packages('ggthemes')
install.packages('dplyr')
install.packages('corrgram')
install.packages('corrplot')
install.packages('caTools')

library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)
library(caTools)

###Paso 5 Correlaciones ###
num.cols<- sapply(df, is.numeric)
num.cols

####Paso 6 Aplicar funci�n anterior y correlaci�n
cor.data <- cor(df[,num.cols])
cor.data

###Paso 7 Graficas de Correlaciones###
print(corrplot(cor.data, method = 'number'))

corrgram(df, order = TRUE, lower.panel = panel.shade,
         upper.panel = panel.pie, text.panel = panel.txt)




