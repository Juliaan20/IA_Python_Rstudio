####Matrices#####
ma<-matrix(0,3,3)
ma

ma<-matrix(1:9,3,3)
ma

ma<-matrix(1:10,3,3)
ma

ma<-matrix(1:9, 3,3, byrow = T)
ma

texto<-matrix(c("hola","ingenieros"),3,3)
texto

#############Extraer Num Aleatorios##############
vec<-sample(1:20, 20, replace = F)
vec

mat <- matrix(vec,  4,  5, byrow = T)
mat

##############Acceder a los valores###############
mat[2,1]

mat[1,]

mat[,3]

mat

tmat<- t(mat)
tmat

mat * 2

mat ^2

mat * mat 

#######Juntar dos matrices #######
##Sembrar semilla
set.seed(200)
mat1<- matrix(sample(1:9, 9, replace = F), 3, 3, byrow = T)
mat1

mat2 <- matrix(sample(1:9, 9, replace= T),3,3,byrow = F)
mat2

mat3 <- mat1+mat2
mat3

#######Ponerle nombre a las filas y columnas
nomcol<-c("Pepito","Ponchito","Cosito")
###ok
colnames(mat3)=nomcol
mat3
###ok
colnames(mat3)<-c("Hola", "Chao","Hambre")
mat3


######RowNames
nomfilas<-c("F1","F2","F3")
nomfilas

rownames(mat3)<-nomfilas
mat3

rownames(mat3, do.NULL = TRUE, prefix = "col")
mat3

######Manera rápida#### :D
dimnames(mat3)<-list(c("f1","f2","f3"), 
                     c("col1","col2","col3"))

mat3

#####Estadísticas
colMeans(mat3)
rowMeans(mat3)
summary(mat3)
nuevacol<-c(12.3, 2.3, 5.6)

mat3<-cbind(mat3, nuevacol)
mat3

f4<-c(2.3, 3.4, 4.5, 2.6, 2.3)
mat3<-rbind(mat3, f4)
mat3


