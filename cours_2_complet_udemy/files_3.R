# Charger le package
library(dplyr)

# Convertir iris en tibble (plus lisible)
iris <- as_tibble(iris)

# ------------------------- SÉLECTION DE COLONNES -------------------------

select(iris, Sepal.Length, Petal.Length, Species)         # Choix manuel
select(iris, starts_with("Petal"))                        # Colonnes qui commencent par "Petal"
select(iris, -Species)                                    # Toutes les colonnes sauf "Species"
select(iris, contains("al"))                              # Colonnes contenant "al"

# ---------------------------- FILTRER LES LIGNES -------------------------

filter(iris, Sepal.Length >= 5, Sepal.Width >= 2)         # Filtres combinés
filter(iris, between(Sepal.Length, 4, 7))                 # Entre 4 et 7
filter(iris, Species == "setosa")                         # Un seul groupe
filter(iris, Species %in% c("setosa", "versicolor"))      # Deux groupes

# ------------------------ UTILISER LE PIPE (%>%) ------------------------

iris %>%
  select(-Species) %>%
  filter_all(all_vars(. > 2))                             # Garder les lignes où toutes les valeurs > 2

# --------------------------- TRIER LES DONNÉES ---------------------------

iris %>% arrange(Sepal.Length)                            # Croissant
iris %>% arrange(desc(Sepal.Length))                      # Décroissant

# -------------------- RÉSUMÉS STATISTIQUES SIMPLES ----------------------

iris %>%
  summarise(
    moyenne_petal = mean(Petal.Length),
    max_petal = max(Petal.Length),
    total = n()                                           # nombre total d'observations
  )

# ------------------- RÉSUMÉS STATISTIQUES PAR GROUPE -------------------

iris %>%
  group_by(Species) %>%
  summarise(
    moyenne_sepal = mean(Sepal.Length),
    max_sepal = max(Sepal.Length),
    total = n()
  )

# ----------------------- AJOUTER OU MODIFIER UNE COLONNE ----------------

iris %>%
  mutate(somme_petal = Petal.Length + Petal.Width)        # Nouvelle colonne

iris %>%
  mutate(Species = NULL)                                  # Supprimer une colonne


#------------------------------Exercice-----------------------------

# Charger les données FastFood
fast_food <- read.csv("FastFoodRestaurants.csv")
fast_food <- as_tibble(fast_food)

# Les 5 villes avec le plus de restaurants
top_villes <- fast_food %>%
  group_by(city) %>%
  summarise(nb = n()) %>%
  arrange(desc(nb)) %>%
  head(5)

# Extraire les noms des villes
city_list <- pull(top_villes, city)


# Les fast food les plus présents dans ces villes
fast_food %>%
  filter(city %in% city_list) %>%
  group_by(name) %>%
  summarise(nombre = n()) %>%
  arrange(desc(nombre))


# Fast food les plus présents aux USA (nombre et pourcentage)
fast_food %>%
  group_by(name) %>%
  summarise(
    nb = n(),
    pourcentage = n() * 100 / nrow(fast_food)
  ) %>%
  arrange(desc(nb))


# Dans quelle ville y a-t-il le plus de McDonald's ?
fast_food %>%
  filter(name == "McDonald's") %>%
  group_by(city) %>%
  summarise(nb = n()) %>%
  arrange(desc(nb))
