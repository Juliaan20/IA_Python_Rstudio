# Vectores
x <- c(1,2,3)
print(x)
x

##Operaciones
2 * x + 1

x ^ 2

a<- sqrt(x)
a

log(x)

exp(x)

sin(x)

##Unir Vectores
x<- c(9.2, 3.5, 6.8, x)
x

y<- 4:9
y

r<-c(x,y)
r

##Vectores Cadena texto
z = c('HOla','Como','Estan','?')
z

2*z

q<-c(x,z)
q
summary(q)

##Acceder a elementos vector
z = c('a','e','i','o','u')

z[1]

z[(3:5)]

resul<- z[-c(2,3,5)]

resul

d<- 1:40
d

resul2<- d[(10:20)]
resul2

z[5]='m'
z

##Gráfica como se vería vector Plano cartesiano
v=c(3,1)
#a<-c(0,5)
#v<-c(3,1)
#y<-c(1,3)

#z<-(v+y)
#z[1]
#z[2]

plot(3,1,main = 'Gráfica de un Vector', xlim = c(0,5), ylim = c(0,5), 
     xlab ='Eje X', ylab = 'Eje Y', lwd=3, col='red')
arrows(0,0,3,1, col='red')

## Construir Gráfica sumar dos vectores
#Primer Vector v (3,1)
plot(3,1,main = 'Gráfica de un Vector', xlim = c(0,5), ylim = c(0,5), 
     xlab ='Eje X', ylab = 'Eje Y', lwd=3, col='red')
arrows(0,0,3,1, col='red')

#Segundo Vector v(1,3)
points(1,3, lwd=3, col='blue')
arrows(0,0,1,3, col='blue')

# El vector suma (x=3+1 , y=1+3)
points(4,4,lwd=3, col='green')
arrows(0,0,4,4,col='green')

# Operación Suma vectores
arrows(1,3,4,4, col='red',lty = 3)
arrows(3,1,4,4, col='blue', lty=3)

#Propiedades Extras
x=c(-1.90, 1.46, 2.36, 2.92)
x
floor(x)

round(x, 1)

trunc(x)

sum(x)

abs(x)

max(x)

min(x)

sort(x, decreasing = TRUE)

mean(x)

median(x)

##Secuencias
1:20

pi:10

s<-seq(0, 50, by=0.5)

##Practicas z[s]

rep(0, times= 40)

rep(c(0,1,2), times=10)

rep(c(0,1,2), each=10)

https://rsanchezs.gitbooks.io/ciencia-de-datos-con-r/content/estructuras_datos/data_frames/data_frames.html








