# ----------------------------- CONDITIONS ET BOUCLES -----------------------------

# Comparateurs simples : supérieur, inférieur
5 > 3         # vrai
4 < 6         # vrai

# Comparateurs inclusifs : inférieur ou égal, supérieur ou égal
4 <= 4        # vrai
4 >= 4        # vrai

# Égalité et différence
3 == 3        # égalité
3 != 3        # différence (faux ici)

# Opérateurs logiques : AND (&), OR (|), version scalaire (&&, ||)
2 == 2 & 1 == 1     # les deux conditions doivent être vraies
2 == 2 && 1 == 2    # ET logique mais retourne un seul booléen (faux ici)

# Comparaison entre vecteurs
c(2, 2) == c(2, 2) & c(3, 2) == c(3, 3)  # élément par élément

# OU logique : au moins une condition vraie
2 == 2 | 1 == 2       # vrai (car 2 == 2)
2 == 2 & 1 == 2       # faux (2e condition fausse)

# ----------------------------- INSTRUCTION IF -----------------------------

# Structure conditionnelle de base
if (5 > 3 | 2 < 3) {
  print("OK")
} else {
  print("Pas vrai")
}

# ----------------------------- BOUCLE FOR -----------------------------

# Parcourir un vecteur et incrémenter les valeurs
for (valeur in c(1, 2, 3, 4, 5)) {
  print(valeur + 1)
}

# Afficher un texte avec chaque valeur
for (element in c(1, 2, 3, 4, 5)) {
  print(paste("Mon chiffre :", element))
}

# Afficher uniquement les éléments compris entre 2 et 4
for (element in c(1, 2, 3, 4, 5)) {
  if (element > 1 & element < 5) {
    print(element)
  }
}

# ----------------------------- BOUCLE WHILE -----------------------------

# Répéter une opération tant qu'une condition est vraie
valeur <- 200

while (valeur / 5 > 1) {
  valeur <- valeur / 5
  print(valeur)
}

# -------------------- EXERCICE BOUCLE AVEC LE JEU iris --------------------

data(iris)

# Compter le nombre de longueurs de sépales >= 5
compteur_in_sup_5 <- 0
for (longueur in iris$Sepal.Length) {
  if (longueur >= 5) {
    compteur_in_sup_5 <- compteur_in_sup_5 + 1
  }
}
print(compteur_in_sup_5)

# Compter le nombre d'observations par espèce
compteur_set <- 0
compteur_ver <- 0
compteur_virg <- 0

for (species in iris$Species) {
  if (species == "setosa") {
    compteur_set <- compteur_set + 1
  } else if (species == "versicolor") {
    compteur_ver <- compteur_ver + 1
  } else {
    compteur_virg <- compteur_virg + 1
  }
}

print(paste("nombre de setosa :", compteur_set))
print(paste("nombre de versicolor :", compteur_ver))
print(paste("nombre de virginica :", compteur_virg))

# Vérifier les dimensions du jeu iris
dim(iris)

# Compter les setosa ayant une longueur de sépale > 5
nombre_setosa_supe_5 <- 0
for (ligne in 1:dim(iris)[1]) {
  individu <- iris[ligne, ]
  if (individu$Species == "setosa" & individu$Sepal.Length > 5) {
    nombre_setosa_supe_5 <- nombre_setosa_supe_5 + 1
  }
}
print(nombre_setosa_supe_5)

# -------------------------- CRÉATION DE FONCTIONS --------------------------

# Structure d'une fonction personnalisée
#nom_de_ma_fonction <- function(argument1, argument2) {
# instructions
# ...
# return(resultat)
#}

# Exemple : fonction qui compte les longueurs > 5 dans Sepal.Length
total_sup_5 <- function(dataframe) {
  compteur <- 0
  for (val in dataframe$Sepal.Length) {
    if (val > 5) {
      compteur <- compteur + 1
    }
  }
  return(compteur)
}

# Exemple : moyenne de Sepal.Length pour les setosa
moyenne_setosa <- function(dataframe) {
  total <- 0
  nb <- 0
  for (i in 1:nrow(dataframe)) {
    if (dataframe[i, "Species"] == "setosa") {
      total <- total + dataframe[i, "Sepal.Length"]
      nb <- nb + 1
    }
  }
  return(total / nb)
}

# Utilisation des fonctions créées
print(total_sup_5(iris))
print(moyenne_setosa(iris))
