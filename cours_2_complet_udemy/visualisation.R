# ------------------------- VISUALISATION EN R -------------------------

# Chargement du jeu de données intégré iris
data(iris)

# Affichage d’un nuage de points entre deux variables
# plot(x, y) : crée un graphique de dispersion (scatter plot)
plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Relation entre longueur et largeur des sépales",
     xlab = "Longueur des sépales",
     ylab = "Largeur des sépales",
     col = "blue",     # Couleur des points
     pch = 16)         # Forme des points (16 = cercle plein)




# Autre graphique avec variables différentes
plot(iris$Sepal.Length, iris$Petal.Width,
     main = "Longueur des sépales vs Largeur des pétales",
     xlab = "Longueur des sépales",
     ylab = "Largeur des pétales",
     col = "red",
     pch = 17)


# Définir les limites des axes (xlim, ylim)
x_min <- min(iris$Sepal.Length, iris$Petal.Width)
x_max <- max(iris$Sepal.Length, iris$Petal.Width)
y_min <- min(iris$Sepal.Width, iris$Petal.Width)
y_max <- max(iris$Sepal.Width, iris$Petal.Width)

plot(iris$Sepal.Length, iris$Petal.Width,
     xlab = "Longueur des sépales",
     ylab = "Largeur des pétales",
     xlim = c(x_min, x_max),
     ylim = c(y_min, y_max),
     col = "darkgreen",
     pch = 19)



# Tracer une ligne reliant les points (lines)
# ATTENTION : lines() s’utilise sur des données déjà triées si on veut que ça soit lisible

# Exemple simple : relier les points (ceci n'est pas une courbe de tendance)
# On prend les 10 premières valeurs pour un affichage plus propre
lines(iris$Sepal.Length[1:10], iris$Petal.Width[1:10],
      col = "skyblue",
      type = "l",   # type = "l" pour ligne
      lwd = 2)      # épaisseur de la ligne




#-----------------------------------------------------------------
# Chargement du jeu de données iris
data(iris)

# Deuxième graphique plus complet
plot(
  iris$Sepal.Length, iris$Sepal.Width,
  xlab = "Longueur",                      # Axe des x
  ylab = "Largeur",                       # Axe des y
  col = "red",                            # Couleur des points (sépales)
  pch = 21,                               # Forme des points
  xlim = c(min(iris$Sepal.Length, iris$Petal.Length),
           max(iris$Sepal.Length, iris$Petal.Length)),
  ylim = c(min(iris$Sepal.Width, iris$Petal.Width),
           max(iris$Sepal.Width, iris$Petal.Width))
)

# Ajouter les points des pétales par-dessus
points(iris$Petal.Length, iris$Petal.Width,
       col = "blue", pch = 22)

# Ajouter un titre
title(main = "Longueur en fonction de largeur", col.main = "blue")

# Ajouter une légende
legend("topright",                        # Position automatique
       legend = c("Sépales", "Pétales"),  # Texte des groupes
       col = c("red", "blue"),            # Couleurs des points
       pch = c(21, 22))                   # Formes des points





# Charger la librairie ggplot2
library(ggplot2)

# Créer un graphique en nuage de points (scatter plot)
# On représente Sepal.Length en x, Petal.Width en y
# La couleur dépend de Petal.Length, la forme dépend de l'espèce
ggplot(iris, aes(x = Sepal.Length,
                 y = Petal.Width,
                 color = Petal.Length,
                 shape = Species)) +
  
  # Ajouter les points avec une taille de 3
  geom_point(size = 3) +
  
  # Définir un dégradé de couleur allant du bleu (valeurs faibles) au rouge (valeurs élevées)
  scale_color_gradient(low = "blue", high = "red") +
  
  # Appliquer un thème graphique minimaliste
  theme_minimal() +
  
  # Personnaliser l'apparence des légendes
  theme(
    # Modifier le titre de la légende : couleur rouge, taille 15, en gras
    legend.title = element_text(colour = "red", size = 15, face = "bold"),
    
    # Modifier le texte de la légende : noir, taille 12, italique
    legend.text = element_text(colour = "black", size = 12, face = "italic"),
    
    # Déplacer la légende en haut du graphique
    legend.position = "top",
    
    # Ajouter un fond gris clair à la légende avec une bordure en pointillés
    legend.background = element_rect(fill = "grey", size = 1, linetype = "dotted")
  )


#modification des nom et des axes et ajout dun titre au graphique
g <- g+xlab("Longueur petal") + ylab("largeur petal") + ggtitle("L et l des petales")




#histogramee 


g <- ggplot(iris, aes(x = Petal.Length, fill = Species)) + geom_histogram(color = "white", biwidth = 0.5)
g
#sauvegarder
dev.off


#boxplot

g <- ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) + geom_boxplot()
g
ggplotly(g)



#excercice



library("ggplot2")
library("dplyr")


fast_food = read.csv("FastFoodRestaurants.csv")


#getwd()

#setwd("C:/Users/fatou/Desktop/cours_2_complet_udemy")


#transformer en tibble

fast_food_tibble = as_tibble(fast_food)


#afficher les villes avec plus de fasfoot








#rendre le graphique interactif

#install.packages("plotly")

library("plotly")

ggplotly(g)
