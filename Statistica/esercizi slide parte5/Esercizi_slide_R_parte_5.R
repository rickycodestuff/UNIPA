

# 1)  Importa il dataframe "Cpus data"

df <- read.csv2("esercizi slide parte5/Cpus_data.csv")



# 2) Trova il percentili 0.1, 0.22, 0.4, 0.75 e 0.99 della variabile Recommended_Customer_Price

percentili <- quantile(df$Recommended_Customer_Price,c(0.1,0.22,0.4,0.75,0.99))


# 3) Dividi la distribuzione in classi utilizzando i percentili trovati in precedenza.

df$cutRCP <-
  cut(df$Recommended_Customer_Price, 
      breaks = c(min(df$Recommended_Customer_Price), 
                 percentili,
                 max(df$Recommended_Customer_Price)),
      include.lowest = T)



# 4)  Calcole le frequenze assolute e relative cumulate

# freq ass
table(df$cutRCP)
# freq ass cumulate
cumsum(table(df$cutRCP))
# freq relative
table(df$cutRCP)/nrow(df)
# freq relative 
cumsum(table(df$cutRCP)/nrow(df))

# 5) Calcola la media della variabili Recommended_Customer_Price prima sulla distribuzione originale
# e poi sulla distribuzione divisa in classi

mean(df$Recommended_Customer_Price)


valori <- c(
  min(df$Recommended_Customer_Price),
  percentili,
  max(df$Recommended_Customer_Price)
)

centrodi <- (valori[1:6] + valori[2:7])/2


weighted.mean(centrodi,table(df$cutRCP))



# 6) rappresenta i boxplot della variabile Recommended_Customer_Price condizionata a Product_Collection


boxplot(df$Recommended_Customer_Price~df$Product_Collection)
library(dplyr)
library(ggplot2)


df |>
  ggplot(aes(x=Product_Collection,y=Recommended_Customer_Price)) +
  geom_boxplot() + theme_minimal()

