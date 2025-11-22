getwd()

setwd("C:/Users/aless/Desktop/LabStat1")

a <- 1:10
a = 1:10

b <- 4
d <- 5

b == d

a <- c(1:10)
save(a, file = "LaboratorioStat1.Rdata")

ls()
rm(a)

rm(list=ls())


ls()
# la distribuzione di x....

vettore_numerico <- c(2,6,8,1,9)
vettore_numerico[3]

typeof(vettore_numerico)

g <- 5.00
k <- 5L

typeof(g)
typeof(k)
sqrt(2)

sqrt(2)^2  == 2


vettore_nomi <- c("alessandro","Cristian")

typeof(vettore_nomi)

1:3


nuovo <- c(vettore_nomi,vettore_numerico)
typeof(nuovo)


?seq

seq(from = 1 ,
    to = 100,
    by = 10)


seq(1, 100, 10)


rep("A", times= 10)
rep(c("A","1"), times= 10)
rep(c("A","1"), each = 10)
rep(c("A","1","C"), each = 10)

rep(c("A","1","C"), c(3,2,1))
rep(c("A","1","C"), c(3,2))


vet1 <- 1:3
vet2 <- c(2,3,4)
vet1 * vet2
vet3 <- c(1,2)

vet1  * vet3

vet1 * 10


vet1[1]

logici <- c(TRUE, FALSE, TRUE)

vet1[logici]

vet1 > 2
vet1[vet1>2]

vet1[vet2<3]


vet1[c(1,2)]
vet1[-c(1,2)]

vet1[!(vet1>2)]


sum((vet1>2) * 1)



which(!(vet1 > 2))

which.max(vet1)
which.min(vet1)


length(vet1)

length(c(vet1,vet2,vet3))
sum(c(vet1,vet2,vet3))

dis <- c(9,2,5,1,8,5)

sort(dis)
sort(dis, decreasing = T)
T

TRUE <- 10
T <- 5


order(dis)

dis[order(dis)]

dis2 <- 1:6

dis2[order(dis)]


a <- 4
a ^ 2
a / 4 -10

a <- a^2



vettore_nomi[1]
which(vettore_nomi=="giuseppe")
which(vettore_nomi=="Alessandro")



X <- matrix(1:10,nrow=4,ncol=3)
X <- matrix(1:10,nrow=4,ncol=3, byrow = T)

cbind()
rbind()

dis
dis2

cbind(dis,dis2)
rbind(dis,dis2)

diag(4)
diag(1:3)



X

X[1]
X[1,3]

X[2,]
X[,2]

X[,-c(1,3)]

X[1:2,]

length(X)
dim(X)

t(X)

X<-matrix(1:4,2,2)
solve(X)



colnames(X)<-c("eta","peso")
rownames(X)<-c("Giuseppe","Giulia")


is.matrix(X)
is.matrix(dis)



lista<-list(matrix(1:9,nrow=3),
            rep(0,3),
            c("buono",'cattivo'))


typeof(lista[[2]])
typeof(lista[[3]])
is.matrix(lista[[1]])


lista[[2]] + 2

lista[[2]] <- lista[[2]] + 2


lista[[1]][1:2,]

unlist(lista)

is.list(lista[1])
is.list(lista[[1]])


X.df <- data.frame(a = 1:4,
            sesso=c("M","F","F","M"))
dim(X.df)


X.df[,2]
X.df$sesso
X.df[2]


X.df$eta<-c(2.5,3,5,6.2)
X.df$eta2<-2

X.df[,"sesso"]


X.df[X.df$sesso=="M","eta"]

subset(X.df, sesso == "M", c(eta,sesso))
