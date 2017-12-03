# Quoi

Devant les difficultés récurentes de GoogleFit à tracer mes séances de course, je crée cette petite api pour les tracer moi-même.
Cela me permet de personnaliser le fond de carte en enlevant tous les détails superflus (ou sponsorisés).
J'ai aussi pu tracer l'ensemble des chemins du Parc du Peuple de l'Herbe à Carrières-sous Poissy (78)


# Comment

En géolocalisant tous les points de passage de mes parcours et en me servant d'un API Google Maps permettant de tracer une ligne brisée sur une carte. 
Cette deuxième version optimise la saisie des points dans un `Array` afin de saisir le premier et dernier point d'une suite. Elle calcule aussi le centre du parcours pour centrer la carte.


# Mais pourquoi ?

A l'heure où j'écris la deuxième version de ce ReadMe, ça me paraît toujours nécessaire car la géolocalisation GoogleFit n'est pas parfaite. Beaucoup de séances ont été perdus et ont du être retracées proprement.
J'hésite maintenant à retracer l'intégralité des séances précédentes pour avoir une homogénéïté des représentations.


# Et ensuite ?

Déjà, calculer le zoom nécessaire à la bonne visualisation du parcours.
J'aimerais aussi arriver à calculer les distances des parcours mais l'api [Distance Matrix](https://developers.google.com/maps/documentation/javascript/examples/distance-matrix) récupère l'adresse connue la plus proche. Je vais voir pour trianguler les positions.
