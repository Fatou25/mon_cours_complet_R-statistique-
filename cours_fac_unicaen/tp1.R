#tp1 

#-------------------------opérations basique----------------------------
3+2
3-2
3*2
3/6
5
1
3+1+1
3-1-1
3*(1+1)
3^4

pi
pi^2

#commentaire

#variable
x=2
a=2
c=4
a*x

FALSE
TRUE

2==2
NA
3>2



#----------------------Vecteurs--------------------------------
vec1 = c(2.8,2.4,2.1,3.6,2.8)
vec1


vec2 = c("rouge", "vert", "vert", "jaune")
vec2

vec3 = c(TRUE, TRUE, FALSE, FALSE, FALSE)
vec3

#avec repetition
rep(4, 3)

vec4 = rep(vec1, 2)
vec4

vec5 = rep(vec1, c(2, 1, 3, 3, 2))
vec5


#creation par construction de suites

vec6 = 1:10
vec6

vec7 = seq(from = 3, to = 5, by = 0.2)
vec7


vec7 = seq(from = 3, length = 11, by = 0.2)
vec7


#Création élément par élément
vec8 = numeric()
vec8[1] = 41.2
vec8[2] = -0.3
vec8[3] = 92
vec8

#logique, chaine de caracteres
vec9 = character()
vec10 = logical()


#------------------------matrice-------------------------
mat1 = matrix(vec4, ncol = 5)
mat1

#remplir la matrice par ligne
mat2 = matrix(vec2, ncol = 5, byrow = T)
mat2

vec1

#cbind concatene des colonnes de vescteurs de même longueur
mat3 = cbind(vec1, 3:7)
mat3

#mettre une diagonale de 2,1,5
mat4 = diag(c(2, 1, 5))
mat4

#extraire une colonne ou une ligne
mat1[, 3]
mat1[2,]

mat1[, c(2,4,5)]
#ou
mat1[, c(FALSE, TRUE, FALSE, TRUE, TRUE)]

mat3[c(1, 4),]

#dimension
dim(mat1)

#----------------------------------Création de liste---------------------

list1 = list(vec1, c("rouge", "bleu"), mat1)
list1

#élément par élément
list2 = list()
list2[1] = vec1
list2[2] = c("rouge", "bleu", "vert")
list2


#-------------------operations sur les vecteurs----------------------

vec11 = vec1
vec13 = vec12 = vec11

#concatener
c(vec1, c(3.9,2.7))



c("blanc", vec2)

vec1[2]
vec1[c(2, 3)]

vec1[2:4]
vec1[-1]

vec12[c(2, 4)]

vec13[-(2:4)]

vec5[3:5] = c(1013, 238, -99)
vec5


#renommer un vecteur
names(vec1) = c("julie", "paul", "solveigh", "valentin", "elsa")
vec1

vec1["paul"]
#enlever les labels attribuer
names(vec1) = c()
vec1


mode(vec1) #type

is.numeric(vec5)

as.character(vec4)
vec1+4
3*vec1 + 1:5
2*vec1 - c(1, 2) #pas la meme longeur
rev(vec1)
sort(vec1)
order(vec1) #par odre croissant
sin(vec1)
sum(vec1)
sd(vec1)
mean(vec1)

#-----------------------------operateur sur les chaines de caracteres--------------
paste("jules", "jim")
paste("jules", "jim", sep = "")

paste("X", 1:4, sep = "")

paste("X", 1:4, c("s", "o"), sep = "")

#-----------------------vecteurs logique------------------

operateurs sur els vecteurs logique

a = c(1, 4, -2, 5)
b = c(2, 4, -3, 6)
a < b

a = c(1, 4, -2, 5, 6, 7, -1)
b = c(1, 4, -3, 5, 6, 7, -2)
a == b

vec1 > 2.7



#compter le nobre d'element strictement supereirur a 
sum(vec1 > 2.7)
(vec1 > 2.7 | vec1 <2)

any(c(3, 2,8,3) <= c(1,2)) #compare et dis si ya au moin un true
all(c(4,1,3,2) <= c(2,4)) #verifie si ils sont tous TRUE

#operations sur les listes
names(list1) = c("poids", "couleur", "matrice")
list2 = list(poids = vec1, couleur = c("rouge", "bleu"), matrice = mat1)

list1[[2]]


#------------------------operation sur les matrice--------------------

dimnames(mat1) = list(c("jules", "jim"), paste("X", 1:5, sep = ""))
mat1

dimnames(mat1) = c()

mat1+5



#--------------------operation specifiques--------------------------------

A = matrix(1:9, ncol = 3)
A

A %*% mat4

B = matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol = 3)

A %*% B

#transpose 

t(mat1)
t(A)

det(B)

solve(mat4) #inverse mat4
solve(B)


#------------------------------------Exercice---------------------------
x = c(1, 3, 5, 7, 9)
y = c(2, 3, 5, 7, 11, 13)
z = c(9, 3, 2, 5, 9, 2, 3, 9, 1)


x+2
y*3
length(x)
x + y
sum(x>5)
sum(x[x>5])
sum(x>5 | x<3)
y[3]
y[-3]
y[x]
(y>7)
y[y>7]
sort(z)
sort(z, dec = TRUE)
rev(z)
order(z) #donne les indices trier par ordre croissant
unique(z)
duplicated(z) #verifier la dupplication
table(z) #les elemnts et le nombre de fois qu'il apparaissent
rep(z, 3)

#--------------------------------------------------------
x0 = c(51,64,71,82,98,107)
x1 = rep(c(5, 6, 3), times = 5)
x1
x2 = 1:10
x2
x3 = c("A", "B", "C", "D", "E", "F", "G")

#--------------------------------------------------
a = 1:7
b = 1:5
# Insertion de v2 entre le 2e et le 3e élément de v1
nouveau_vecteur = c(v1[1:2], v2, v1[3:length(v1)])

#------------------------------------------------------------
x = seq(from = 2, to = 8, by = 0.1)
x
exp(x) * sin(x)

#------------------------------------------------------------
x = c (4.12, 1.84, 4.28, 4.23, 1.74, 2.06, 3.37, 3.83, 5.15, 3.76, 3.23, 4.87, 5.96,
       2.29, 4.58)


a = x[-c(1:4)]
a

b = x[-c(1, 15)]
b

c = x[x > 2.57]
c

d = x[x > 4.07 | x < 1.48]
d

min(x)
which.min(x) #indice du plus petit

#-----------------------------------------------
x = 1:10
y = 10:20
a = y[-1] - x[-length(x)] #calcule en elevant le 1er element de x et le dernier element de y
a

b = cos(y[-length(y)]) / sin(x[-1])
b

#------------------------------------------------------------
y0 = seq(from = 0, to = 10, by = 2)
y0

y1 = seq(from = 2, to = 18, by = 2)
y1

y2 = rep(4,20)
y2

y3 = seq(from = 0, to = 10, length.out = 20)
y3
y3[3]
y3[-3]

#transformer y3 en matrice de deux lignes et 10 colonnes
matrix(y3, nrow = 2)

#transforme y3 envecteur de colonne
matrix(y3, byrow = TRUE)

A = matrix(1:12, ncol = 3, nrow = 4, byrow = TRUE)
A
A[2, 3]
A[, 1]
A[2,]
c = A[c(1, 4),]
c

#----------------------------------------
diagonale = matrix(1, nrow= 9, ncol = 9)
diag(diagonale) = 0
diagonale

#--------------------------------------------------
x = 1:6
y = 5:10
c = x + y 
c[c>11] = 1
c

x %*% y

#----------------------------------------------------
M = matrix(1:36, nrow = 6)
M

x %*% M
x %*% M
t(M)
M %*% (t(M))
#--------------------------------------------------------------------

Poids = c(95, 68, 85, 72, 55, 86, 115)
Taille = c(189, 169, 179, 167, 171, 178, 179)
data = rbind("Poids" = Poids, "Taille" = Taille)
colnames(data) = c("John", "Lilly", "Stef", "Bob", "Anna", "Marik", "Boris")
data

#ou
M = matrix(c(95, 189, 68, 169, 85, 179, 72, 167, 55, 171, 86, 178, 115, 179), ncol = 7)
dimnames(M) = list(c("Poids", "Taille"), c("John", "Lilly", "Stef", "Bob",
                                           "Anna", "Marik", "Boris"))
M


#-------------------------------------------------------------
A <- matrix(
  c(-2, 1, -2, -1,     # colonne 1
    1, 2, 1, -3,      # colonne 2
    -3, 1, 1, 1,       # colonne 3
    -2, -1, -1, 1),    # colonne 4
  ncol = 4
)
A
solve(A)
det(A) #different de 0 donc inversible

B <- matrix(
  c( 2,  2, -2, -1,    # colonne 1
     -1, -2,  1, -3,    # colonne 2
     3,  4,  3,  1,    # colonne 3
     -4, -5, -1, -1),   # colonne 4
     ncol = 4
)
B
det(B) #different de 0 inversible
solve(B)
7
det(t(A))
det(A)

all.equal(det(t(A)), det(A))

det(solve(A)) == 1/det(t(A))

all.equal(det(A %*% B), det(A) * det(B))

all.equal(t(solve(A)),solve(t(A)))
all.equal(t(A%*%B), t(A) %*% t(B))

all.equal(solve(A%*%B), solve(B )* solve(B))



#----------------------------------------------------
A = matrix(0, nrow = 5, ncol = 5)
A

B = abs(col(A) - row(A)) + 1
B

det(B) #B est inversible

#resoudre l'équation en utilsant B
solve(B) %*% c(1, 2, 2, 3, 2) 
#------------------------------------------------------------
