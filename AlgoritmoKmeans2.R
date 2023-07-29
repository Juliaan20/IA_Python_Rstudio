###Algoritmo KMEANS###
##Paso 1:
data("USArrests")

##Paso 2:Escalonar los datos
df <- scale(USArrests)
df

##Paso 3: Técnica del codo identificar los cluster
install.packages("factoextra")

library(factoextra)

fviz_nbclust(df, kmeans, method ="wss")+
  geom_vline(xintercept = 4, linetype=2)

##Paso 4: Construir el modelo
set.seed(145)
km.res<- kmeans(df, 4, nstart = 25)
##Revisar los cluster
km.res$cluster
###Revisar los centros
km.res$centers
##Tamaño del cluster
km.res$size

##Paso 5: Ver los cluster
fviz_cluster(km.res, data = df, 
             palette=c("blue","yellow","green","darkorange"),
             ellipse.type = "euclid",
             stand.plot= TRUE,
             repel = TRUE,
             ggtheme = theme_minimal()
)



