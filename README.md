# Secured - Implémentation d'une Table de Hachage

## Description
Une bibliothèque en C implémentant une table de hachage pour le stockage sécurisé de données avec gestion des collisions. Ce projet fait partie du module "Elementary Programming in C".

## Objectifs du Projet
- Implémenter une table de hachage avec chaînage séparé pour gérer les collisions
- Créer une fonction de hachage efficace
- Gérer les opérations sur les paires clé-valeur (insertion, suppression, recherche)
- Apprendre la création de bibliothèques et les concepts cryptographiques

## Compilation
```
make # Compiler la bibliothèque
make re # Recompiler
make clean # Supprimer les fichier objets
make fclean # Supprimer les fichiers obkets et la bibliothèque
```
# Fonctions
## Fonction de Hachage
```
int hash(char *key, int len);
```
Transforme une clé en chaîne de caractères en valeur numérique selon les critères :

 - Sortie déterministe pour une même entrée
 - Utilisation de toutes les données d'entrée
 - Sorties différentes pour des entrées similaires
 - Distribution uniforme dans la table

## Gestion de la Table de Hachage
```
hashtable_t *new_hashtable(int (*hash)(char *, int), int len);
void delete_hashtable(hashtable_t *ht);
```
Fonctions pour créer et supprimer des tables de hachage. Un pointeur de fonction permet de personnaliser la fonction de hachage.

## Opérations sur la Table
```
int ht_insert(hashtable_t *ht, char *key, char *value);
int ht_delete(hashtable_t *ht, char *key);
char *ht_search(hashtable_t *ht, char *key);
void ht_dump(hashtable_t *ht);
```

Insert : Ajoute ou met à jour des paires clé-valeur
Delete : Supprime des entrées par clé
Search : Recherche des valeurs par clé
Dump : Affiche le contenu de la table

## Détails Techniques

 - Langage : C
 - Fonctions autorisées : write, malloc, free
 - En cas d'erreur : sortie avec code 84
 - En cas de succès : sortie avec code 0

## Gestion des Erreurs

 - Les messages d'erreur doivent être écrits sur la sortie d'erreur
 - Vérification des allocations mémoire
 - Gestion des cas limites (table pleine, clé non trouvée, etc.)

## Structure du Projet
```
.
├── include
│   ├── hashtable.h
│   └── my.h
├── lib
├── Makefile
├── README.md
└── src
    ├── delete.c
    ├── delete_hashtable.c
    ├── dump.c
    ├── hash.c
    ├── insert.c
    ├── Makefile
    ├── new_hashtable.c
    └── search.c
```

## Exemple d'Utilisation
```
int main(void)
{
    // Création d'une table de taille 4
    hashtable_t *ht = new_hashtable(&hash, 4);
    
    // Insertion de données
    ht_insert(ht, "Vision", "./Documents/Tournament/Modules/Vision");
    ht_insert(ht, "Config", "./config.json");
    
    // Recherche
    char *value = ht_search(ht, "Vision");
    
    // Affichage de la table
    ht_dump(ht);
    
    // Nettoyage
    delete_hashtable(ht);
    return 0;
}
```

## Notes Supplémentaires

 - La gestion des collisions est effectuée par chaînage séparé
 - La mise à jour d'une valeur existante doit remplacer l'ancienne valeur
 - La table doit être capable de gérer un grand nombre d'entrées efficacement
