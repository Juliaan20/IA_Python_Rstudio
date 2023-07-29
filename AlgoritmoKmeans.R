#####Paso 1: Importar el DataSet snsdata.csv
teens

####Paso 2: Explorando los datos
str(teens)

head(str(teens$gender))

####Conocer cuantos datos de Gender hay sin contar NA
table(teens$gender)

###Conocer cuantos datos de Gender hay contado NA 9%
table(teens$gender, useNA = "ifany")


###Conocer cuantos datos estan faltantes para Age 17%

summary(teens$age)

###Modificar datos acorde a edades de Colegio 13 & 20
teens$age <- ifelse(teens$age >=13 & teens$age <20, teens$age, NA)

summary(teens$age)


###Modificar a Binario para poder dejar dos clases
teens$female <- ifelse(teens$gender =="F" & !is.na(teens$gender),1,0)

teens$nogender<- ifelse(is.na(teens$gender), 1, 0)

table(teens$gender, useNA = "ifany")

table(teens$female, useNA = "ifany")

table(teens$nogender, useNA = "ifany")

####Paso 3 Imputación para corregir los 5.523 datos faltantes de Age
mean(teens$age)

###Conociendo la media para sobreescribir los datos
mean(teens$age, na.rm = TRUE)

###Se utiliza aggregate para comparar el año de graduación con la edad y ser coherentes
aggregate(data = teens, age ~ gradyear, mean, na.rm = TRUE)

##saca promedio de grupos de variables
ave_age <- ave(teens$age, teens$gradyear, FUN =
                 function(x) mean(x, na.rm = TRUE))

teens$age <- ifelse(is.na(teens$age), ave_age, teens$age)

summary(teens$age)

####Paso 4 Entrenando el modelo
interests <- teens[5:40]

###Estandarizar los datos
interests_z <- as.data.frame(lapply(interests, scale))

###Creamos el modelo
teen_clusters <- kmeans(interests_z, 5)

###Paso 5 Evaluando el modelo
teen_clusters

teen_clusters$size

centers<-as.data.frame(teen_clusters$centers)
centers

str(centers)

###Coordenadas de los cluster
teen_clusters$centers

interests_z$cluster<- teen_clusters$cluster

summary(interests_z)

library(dplyr)

agruCluster<-interests_z %>% group_by(cluster) %>% summarise(cantidad= n()) 
agruCluster


filtroCluster<- interests_z %>% filter(cluster == 1) 
filtroCluster

str(filtroCluster)

####pasamos los cluster a el dataframe original
teens$cluster <- teen_clusters$cluster

teens[1:5, c("cluster", "gender", "age", "friends")]

####Revisando características
aggregate(data = teens, age ~ cluster, mean)

####Participación de mujeres
aggregate(data = teens, female ~ cluster, mean)

###Cantidad de Amigos
aggregate(data = teens, friends ~ cluster, mean)

library(ggplot2)

ggplot() +
  geom_point(data = interests_z, 
             mapping = aes(x = interests$basketball,
                           y = interests$football, 
                           colour = cluster))
library(factoextra)

fviz_cluster(teen_clusters, data = interests_z,
             palette = c("#2E9FDF", "#00AFBB", "#E7B800","#4a148c","#00bfa5"), 
             geom = "point",
             ellipse= TRUE,
             show.clust.cent = TRUE,
             ellipse.type = "euclid", 
             ggtheme = theme_bw()
)






