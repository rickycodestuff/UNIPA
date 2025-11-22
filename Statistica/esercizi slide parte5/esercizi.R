# 1 - Importa il dataframe "Cpus_data"

# la funzione read.csv() resistuisce gia' un dataframe quindi non abbiamo
# bisogno di usare la funzione data.frame()
cpus_data <- read.csv2("esercizi slide parte5/Cpus_data.csv")

# 2 - Trova i percentili 0.1, 0.22, 0.4, 0.75 e 0.99 della variabile
# "Recommended Customer Price"
percentile <- quantile(cpus_data$Recommended_Customer_Price,
                       c(0.1, 0.22, 0.4, 0.75, 0.99))

# 3 - Dividi la distribuzione in classi utilizzando i percentili trovati in precedenza

# quindi creaiamo una nuova colonna nel data set che avra' le classi di 
# "Reccomended Customer Price"
cpus_data$cutRCP <- 
  cut(cpus_data$Recommended_Customer_Price,
      breaks = 
        
        # questo break fara' in modo che il primo intervallo sara'
        # [ valore minimo della colonna, primo valore dei percentili ]
        # ] secondo valore dei percentili, terzo valore dei percentili ]
        # etc etc fino a
        # ] ultimo valore dei percentili, valore massimo della colonna ]
        c(
          min(cpus_data$Recommended_Customer_Price),
          percentile,
          max(cpus_data$Recommended_Customer_Price)
        ),
      include.lowest = T
  )

# 4 - Calcola le frequenze assolute e relative cumulate

# freq. assoluta e freq. assoluta cumulata
freq_ass <- table(cpus_data$cutRCP)
cumsum(freq_ass)

# freq. relativa e freq. relativa cumulata
freq_rel <- freq_ass / nrow(cpus_data)
cumsum(freq_rel)

# 5 - Calcola la media della variabile "Recommended Customer Price"

# media sulla distrubuzione originale
mean(cpus_data$Recommended_Customer_Price)

# media sulla distrubuzione per classi

# riprendiamo i valori ci ciascuna classe
classes <- c(
  min(cpus_data$Recommended_Customer_Price),
  percentile,
  max(cpus_data$Recommended_Customer_Price)
)

# calcoliamo ora la mediana ci ciascuna classe, ovvero i centroidi
# la mediana e' il valore "in mezzo" ad una struttura dati; nel nostro caso
# la struttrua dati sono i vari intervalli delle classi, quindi in realta'
# sono slices (sotto-vettori) di lunghezza 2
centroids <- (classes[1:6] + classes[2:7]) / 2

# una volta trovati i centroidi i calcolo e' semplice
# sommatoria di (frequenza assoluta * centroide) / centroide 
sum(freq_ass * centroids) / sum(centroids)
weighted.mean(centroids, table(cpus_data$cutRCP))

# 6 - Rappresenta i boxplot della variabile "Recommended Customer Price"
# condizionata a "Product Collection"

# modo semplice di mostrare i dati con un grafico
boxplot(cpus_data$Recommended_Customer_Price~cpus_data$Product_Collection)
library(dplyr)
library(ggplot2)

# metodo piu' "complesso" ma migliore
cpus_data |>
  ggplot(
    aes( x = Product_Collection,
         y = Recommended_Customer_Price)
    ) +
  geom_boxplot() + theme_minimal()
