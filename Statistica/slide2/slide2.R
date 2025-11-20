# importare DatiStat1.txt
df <- read.table("slide2/DatiStat1.txt", header = T)
head(df)

# Controllare la natura delle variabili
str(df)
typeof(df)
class(df)

# Assegnate ad un nuovo vettore che chiamarete “alt” la variabilie Altezza
alt <- df$Alteza

# Definite il grado di istruzione del padre e della madre come fattori ordinali
factor(df$GIP,
       levels= c("Elementare","Media",
                 "Diploma","Laurea"),
       ordered = T)

factor(df$GIM,
       levels= c("Elementare","Media",
                 "Diploma","Laurea"),
       ordered = T)

# Selezionate gli studenti provenienti dal Liceo Scientifico
subset(df, Diploma == "Scientifico")

# Selezionare gli studenti piu bassi di 168 cm e identificarli (individuare la loro `
# posizione all’interno del database)
which(df$Altezza < 168) + 1 # + 1 poiche' non contiamo la riga header

# Selezionate solo gli studenti i cui genitori hanno entrambi il grado di istruzione
# ”Laurea”
subset(df, GIM == "Laurea" & GIP == "Laurea")

