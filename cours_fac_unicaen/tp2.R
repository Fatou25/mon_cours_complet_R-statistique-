# --------------------------- Data Frame ---------------------------

# Création d'une matrice et transformation en data.frame
mat <- matrix(1:9, ncol = 3)
as.data.frame(mat)

# Données simples
age = c(24, 26, 22)
sexe = c("H", "H", "F")
love = c(TRUE, FALSE, TRUE)

# Création d’un data frame
enquete = data.frame(age, sexe, love)

# Transformer une variable en facteur
sexe = factor(sexe)
levels(sexe)

# Renommer les colonnes
names(enquete) = c("Age", "Sexe", "Love")

# Renommer les lignes
row.names(enquete) = c("Jules", "Jim", "Elsa")

# Recréer le data frame (autre méthode équivalente)
enquete = data.frame(Age = age, Sexe = sexe, Love = love,
                      row.names = c("Jules", "Jim", "Elsa"))

summary(enquete)

# Accès aux colonnes
enquete$Age

# Utilisation de attach/detach
attach(enquete)
Age
detach(enquete)

attach(enquete)
table(Sexe)        # Effectifs par modalité
table(Sexe, Love)  # Tableau croisé
detach(enquete)

# ------------------------ Data Frame Région ------------------------

basnor = data.frame(
  region = c("Calvados", "Manche", "Orne"),
  pop = c(664000, 489500, 29337),
  superficie = c(5548, 5538, 6103)
)

str(basnor)
basnor$region
class(basnor$region)
class(basnor$superficie)

basnor$superficie[1]
class(basnor[1])        # data.frame
length(basnor)          # nb de colonnes
basnor[[1]]             # colonne 1
basnor[1, 2]            # ligne 1, colonne 2
basnor[2:3, 1:3]        # sous-tableau
basnor[, 2:3]

# Filtres
basnor[basnor$superficie < 6000, ]
basnor[basnor$superficie < 6000, c("region", "superficie")]

attach(basnor)
basnor[superficie < 6000, c("region", "superficie")]
mean(superficie)
var(superficie)
detach(basnor)

# ---------------------- Valeurs manquantes ----------------------

u <- c(31, 43, NA, 36, NA)
is.na(u)
mean(u, na.rm = TRUE)

# Exemple de lecture de fichier (commenté ici)
# donnees <- read.table("données.txt", header = TRUE, na.strings = "NA")
# donnees[!complete.cases(donnees), ]
# donnees2 <- na.omit(donnees)

# ------------------- Conditions, boucles, fonctions -------------------

vec = c(1, 3, 2, 4, 7, 5, 6, 9, 8)

# If
a = if (mean(vec) > 6) 1:9 else rev(1:9)
a

# For
b = numeric()
for (i in 1:(length(vec) - 1)) {
  b[i] = vec[i] + vec[i + 1]
}
b

# While
while (mean(vec) < 10) {
  vec = vec + 1
}
vec

# Repeat
t = 1
repeat {
  t = 3 * t + 1
  if (t >= 15.3) break
}
t

# ------------------- Fonctions personnalisées -------------------

arrangement = function(n, k) {
  factorial(n) / factorial(n - k)
}
arrangement(7, 3)

courbe = function(x) {
  sqrt(x + exp(x))
}
courbe(1)

moyennemat = function(x) {
  apply(x, 2, mean)
}

mat = matrix(1:9, ncol = 3)
moyennemat(mat)

compter = function(a, b) {
  d = numeric()
  for (i in 1:length(a)) {
    d[i] = sum(b == a[i])
  }
  names(d) = as.character(a)
  return(d)
}

# ---------------------- apply(), sapply(), tapply() ----------------------

apply(mat, 1, mean)

couleur = c("rose", "vert", "jaune", "violet")
fleurs = c("rose", "rose", "vert", "rose", "rose", "jaune", "jaune")
compter(couleur, fleurs)

# Correction de la parenthèse manquante
apply(mat, 1, function(x) { sum(x > 5) })

# Liste
liste = list(c(1, 2), c(3, 1, 2))
sapply(liste, mean)
lapply(liste, sd)

# tapply / split
tapply(Age, Sexe, mean)
split(Age, Sexe)

# -------------------- Visualisation et nettoyage --------------------

# Jeu de données intégré
data("airquality")
head(airquality)
names(airquality)
dim(airquality)
summary(airquality)
var(airquality$Temp)
sd(airquality$Temp)

# Accès lignes/colonnes
airquality[2, ]
airquality[, 3]
airquality[c(1, 2, 4), ]
airquality[3:6, ]
airquality[, -(1:2)]

# Filtrage
airquality[airquality$Temp > 90, ]

# Ajout et suppression de colonnes logiques
airquality$TooWindy <- airquality$Wind > 10
airquality[!airquality$TooWindy, ]   # lignes où TooWindy est FALSE
airquality$TooWindy <- NULL          # suppression

# Supprimer les NA dans Ozone
airquality_privee <- airquality[!is.na(airquality$Ozone), ]

# ---------------------- ggplot2 : qplot ----------------------

# install.packages("ggplot2") # si besoin
library(ggplot2)

# Nuage de points
qplot(Temp, Ozone, data = airquality, color = Month)


getwd()

setwd("C:/Users/fatou/Desktop/cours_fac_unicaen")

conso.data = read.table("donneesconsommation.txt", header = T)
conso.dat
dim(conso.dat)

attach(conso.dat)
str(conso.dat)
summary(conso.data)

names(conso.dat)

#Extraire les donnees des individus
conso.data[(conso.data$Cafe == "AC") & conso.data$Revenu < 15000, ] 

names(conso.data)

conso.data[(conso.data$Enfants > 3) & (conso.data$Pates) > 60 & (conso.data$Revenu),]




f = function(m,n){
  x = 1:n
  y = x^m
  sum(y)
}


fonc2 = function(x){
  n = length(x)
  x^(1:n) / (1:n)
}

fonc3 = function(x){
  n = length(x)
  (x[1:(n-2)] + x[2:(n-1)] + x[3/n]) /3
}

fonc4 = function(x){
  ifelse( x >= 0, (1/10) * exp(-x / 10), 0)
}

fonc5 = function(k,n,p){
  choose(n, k) * p^k * (1 -p)^(n-k)
}

fonc6 = function(k, lambda){
  exp(-lambda) * (lambda^k / factorial(k))
}

Loop = function(n){
  x = numeric()
  x[1] = 0.5
  for(j in 2:n)
    x[j] = 1 + 0.25 * x[j-1]^2
  x
}

Loop(500)