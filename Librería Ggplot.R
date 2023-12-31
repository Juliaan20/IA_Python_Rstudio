####Librer�a ggplot2 #####
install.packages('ggplot2')
###Cargar Libreria en la sesi�n
library(ggplot2)
###Dataframe mtcars
data()

mtcars

###Funciona librer�a (capas)
ggplot(mtcars, aes(gear))+ geom_bar()

ggplot(mtcars, aes(gear))+ geom_bar()+ xlab("# velocidades") +
  ylab("Cantidades") + ggtitle("Gr�fico de Barras")

ggplot(mtcars, aes(gear))+ geom_bar(color="blue", fill="green")+ xlab("# velocidades") +
  ylab("Cantidades") + ggtitle("Gr�fico de Barras")

ggplot(mtcars, aes(gear))+ geom_bar(color="blue", fill="green")+ xlab("# velocidades") +
  ylab("Cantidades") + ggtitle("Gr�fico de Barras")+ coord_flip()

ggplot(mtcars, aes(gear, fill=as.factor(gear)))+ geom_bar()+xlab("# velocidades") +
  ylab("Cantidades") + ggtitle("Gr�fico de Barras") + labs(fill="Velocidades")+
  theme_minimal()
###Librer�a para correlaciones (-1 a 1) / entre mas cerca esta a 1 mejor relacionadas
library(ggcorrplot)

corr <- round(cor(mtcars),1)
corr

ggcorrplot(corr)+ggtitle("Correlaciones")+theme_classic()

mtcars




