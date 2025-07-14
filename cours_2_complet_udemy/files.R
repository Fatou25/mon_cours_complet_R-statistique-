# -------------------------------- VECTEURS -----------------------------------

# Créer un vecteur contenant les moyennes de 20 élèves (valeurs entre 1 et 20)
moyenne_de_la_classe <- sample(1:20, 20)

# Associer un prénom à chaque élève dans le vecteur
names(moyenne_de_la_classe) <- c("Alice", "Lucas", "Emma", "Léo", "Chloé", "Nathan", "Inès", "Hugo", "Lina", "Gabriel",
                                 "Jade", "Noah", "Sarah", "Raphaël", "Manon", "Tom", "Camille", "Ethan", "Lou", "Louis")

# Calculer la moyenne générale de la classe
moyenne_generale <- mean(moyenne_de_la_classe)

# Trouver la plus petite et la plus grande note
petite_note <- min(moyenne_de_la_classe)
grande_note <- max(moyenne_de_la_classe)

# Extraire les élèves ayant une note supérieure à la moyenne
eleve_sup_moyenne_generale <- moyenne_de_la_classe[moyenne_de_la_classe > moyenne_generale]

# Compter combien d'élèves sont au-dessus de la moyenne
nb <- length(eleve_sup_moyenne_generale)

# Créer un tableau récapitulatif
# Contient : moyenne générale, nombre d'élèves au-dessus, note min/max parmi eux
tableau_recap <- c(moyenne_generale, nb, min(eleve_sup_moyenne_generale), max(eleve_sup_moyenne_generale))
names(tableau_recap) <- c("moyenne_generale", "nbe_etudiant", "moins_bonne_note", "note_la_eleve")

# Trier les notes de la plus grande à la plus petite
sort(moyenne_de_la_classe, decreasing = TRUE)

# Résumé statistique du vecteur : min, max, quartiles, moyenne
summary(moyenne_de_la_classe)


# ------------------------------- MATRICES ------------------------------------

# Générer 15 notes aléatoires pour remplir une matrice 5x3
notes <- sample(1:20, 15)

# Créer une matrice de notes avec 5 lignes (élèves) et 3 colonnes (matières)
notes_des_eleves <- matrix(notes, ncol = 3, nrow = 5)

# Nommer les colonnes (matières) et lignes (élèves)
colnames(notes_des_eleves) <- c("SVT", "Mathematiques", "Francais")
rownames(notes_des_eleves) <- c("Fatou", "DIALLO", "BAH", "Aicha", "Fatima")

# Accès à certains éléments de la matrice
notes_des_eleves["Fatou", "Francais"]             # Note de Fatou en Français
notes_des_eleves[c("Fatou", "Aicha"), "Francais"] # Notes de Fatou et Aicha en Français

# Modifier des valeurs spécifiques dans la matrice
notes_des_eleves[c("Aicha", "Fatou"), "Francais"] <- c(15, 10)

# Créer une matrice de coefficients pour pondérer les notes
notes_2 <- c(rep(0.5, 5), rep(1, 5), rep(0.9, 5))
matrice_des_notes <- matrix(notes_2, ncol = 3, nrow = 5)

# Faire des opérations élément par élément entre les deux matrices
notes_des_eleves * matrice_des_notes  # Produit pondéré
rowSums(notes_des_eleves)             # Somme par élève
colMeans(notes_des_eleves)            # Moyenne par matière


# --------------------------- EXERCICE MATRICIEL -----------------------------

# Charger le package et le jeu de données HorsePrices
install.packages("Stat2Data")
library("Stat2Data")
data("HorsePrices")

# Extraire les colonnes numériques utiles et transformer en matrice
matrice_prix_cheval <- as.matrix(HorsePrices[, -c(1, 5)])
rownames(matrice_prix_cheval) <- HorsePrices[, 1] # ID des chevaux
colnames(matrice_prix_cheval) <- c("prix", "age", "taille")

# Conversion des unités : taille en mètres, prix en euros
matrice_prix_cheval[, 3] <- matrice_prix_cheval[, 3] * 0.1016
matrice_prix_cheval[, 1] <- matrice_prix_cheval[, 1] * 0.86

# Supprimer les lignes avec valeurs manquantes
matrice_prix_cheval <- na.omit(matrice_prix_cheval)

# Rechercher les chevaux les moins et les plus chers
matrice_prix_cheval[matrice_prix_cheval[, 1] == min(matrice_prix_cheval[, 1]), ]
matrice_prix_cheval[matrice_prix_cheval[, 1] == max(matrice_prix_cheval[, 1]), ]

# Filtrer les chevaux selon leur taille
matrice_prix_cheval[matrice_prix_cheval[, 3] <= 1.6, ]


# ----------------------------- DATA FRAME -----------------------------------

# Créer un data frame contenant différents types de variables
mon_data_frame <- data.frame(
  Age = c(18, 24, 54, 78),
  Poids = c(64, 76, 84, 62),
  Sexe = c("M", "F", "M", "F"),
  val_bool = c(TRUE, TRUE, TRUE, FALSE)
)
rownames(mon_data_frame) <- c("Jean", "Zoé", "Lucas", "Fatou")

# Importer un fichier CSV (2 méthodes)
data_iris <- read.csv("iris.csv", row.names = 1)

# Exporter un fichier CSV
write.csv(data_iris, file = "iris_3.csv", row.names = TRUE)

# Sauvegarder/Charger un objet R (rapide)
save(data_iris, file = "iris.Rdata")
load("iris.Rdata")

# Accès à des colonnes et sous-ensembles du dataframe
head(data_iris[, 1:3])                           # Affiche les 3 premières colonnes
head(data_iris[data_iris$Species == "setosa", ]) # Lignes où l'espèce est setosa

# Filtrer les lignes avec subset
subset(data_iris, Species == "setosa" & Petal.Length > 1.4, select = c("Petal.Length"))


# ------------------------------ FACTORS -------------------------------------

# Vérifier le type de la variable Species
class(data_iris$Species)  # factor

# Renommer les colonnes et lignes pour plus de clarté
colnames(iris) <- c("Longueur_sepal", "Largeur_sepal", "Longueur_petales", "Largeur_petales", "Especes")
rownames(iris) <- paste("iris_", rownames(iris), sep = "")

# Statistiques conditionnelles
min(iris[iris$Especes == "setosa", 3])  # Min Petal.Length pour setosa
mean(iris[iris$Especes == "versicolor", 3])

# Séparer variables quantitatives et qualitatives
data_iris_quanti <- iris[, 1:4]
data_iris_quali <- data.frame(Especes = iris[, 5], row.names = rownames(iris))

# Fusion des deux tableaux en un seul
iris_complet <- merge(data_iris_quanti, data_iris_quali, by = "row.names")
iris_complet <- iris_complet[, -1]  # Supprimer colonne des row.names doublons

# Combinaisons de tableaux
head(cbind(data_iris_quali, data_iris_quanti)) # Horizontalement
rbind(iris, iris)                               # Verticalement (2x le même tableau)
