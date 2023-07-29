

##paso1 importar data frame##

###paso2##estructura

str(student_mat)
student_mat<-as.character(student_mat$G3)

class(student_mat)


#conversion data frame#
df<-as.data.frame(student_mat)
df

class(df)


#paso3#revisar inconsistentes outliers#

any(is.na(df))

str(df)

###pasar 4 librerias##

install.packages("dplyr")
install.packages("corrgram")
install.packages("corrplot")
install.packages("caTools")


library(dplyr)
library(corrgram)
library(corrplot)
library(CaTools)


#paso 5 correlaciones##

num.cols<-sapply(df, is.numeric)
num.cols

#paso 6 aplicar la funcion anterior y correlacion

cor.data <-cor(df[,num.cols])
cor.data


##paso 7######

print(corrplot(cor.data, method = 'number'))


corrgram(df, order = TRUE, lower.panel = panel.shade,
      upper.panel = panel.pie, text.panel = panel.txt)
