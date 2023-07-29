
### importar libreria###

library(readr)
titanic_train <- read_csv("C:/Users/Familia/Desktop/titanic_train.csv")
View(titanic_train)


#####PASO 1 revisar Estructura ###
head(titanic_train)
str(titanic_train)

class(df)

df <- as.data.frame(titanic_train)
df

str(df)
###PASO 2 Revisar cuantos datos NA o Null hay
install.packages('Amelia')
library(Amelia)

missmap(df, main="Datos Faltantes", col=c("yellow","black"), legend = FALSE)

library(ggplot2)

ggplot(df, aes(Survived)) + geom_bar()

ggplot(df, aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))

ggplot(df, aes(Sex)) + geom_bar(aes(fill=factor(Sex)))

ggplot(df, aes(Age)) +geom_histogram(bins = 20, alpha=0.5, fill='blue')

ggplot(df, aes(SibSp)) + geom_bar()

ggplot(df, aes(Fare)) + geom_histogram(fill="green",color="black", alpha=0.5)

###Paso 3 Hallar medias por clase para reemplazar la edad
pl<- ggplot(df, aes(Pclass, Age))

pl + geom_boxplot(aes(group=Pclass, fill=factor(Pclass), alpha=0.4))

pl + scale_y_continuous(breaks = seq(min(0), max(80), by=2)) + theme_bw()


summary(df)

###Paso 4 Funcion para Imputación de edades por medio de función
#clase 1: 39
#clase 2: 29
#clase 3: 24
correcion_edades <- function(age, class){
  out<-age
  for(i in 1:length(age)){
    if(is.na(age[i])){
      if(class[i]==1){
        out[i]<-39
      }else if(class[i]==2){
        out[i]<-29
      }else{
        out[i]<-24
      }
    }else{
      out[i]<-age[i]
    }
  }
  return (out)
}

###Paso 5 Limpieza de datos en Age
df$Age <- correcion_edades(df$Age, df$Pclass)


missmap(df, main="Datos Corregidos", col=c("yellow","black"), legend = FALSE)

###Paso 6 Subset Datos
library(dplyr)

df <- select(df, -PassengerId, -Name, -Ticket, -Cabin)
head(df)
str(df)

###Paso 7 Convertir a Factor
df$Survived <- factor(df$Survived)
df$Pclass <- factor(df$Pclass)
df$SibSp<- factor(df$SibSp)
df$Parch <- factor(df$Parch)

str(df)

###Paso 8: creación del modelo
log.model <- glm(Survived~., family = binomial(link = "logit"), data = df)

summary(log.model)

###Paso 9: Datos train & testing
library(caTools)

split <- sample.split(df$Survived, SplitRatio = 0.7)
head(split)

final.train<- subset(df, split= TRUE)

final.test <- subset(df, split= FALSE)

final.log.model <- glm(Survived~., family = binomial(link = "logit"), data = final.train)

summary(final.log.model)

###Paso 10: Predicciones y Matriz de Confusión
predecir <- predict(final.log.model, final.test, type = "response")
predecir

real.prediccion <- ifelse(predecir>0.5, 1, 0)

real.prediccion

table(final.test$Survived, real.prediccion>0.5)
