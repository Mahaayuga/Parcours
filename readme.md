# Quoi

Devant les difficultés récurrentes de GoogleFit à tracer mes séances de course, je crée cette petite api pour les tracer moi-même.
Cela me permet de personnaliser le fond de carte en enlevant tous les détails superflus (ou sponsorisés).
J'ai aussi pu tracer l'ensemble des chemins du Parc du Peuple de l'Herbe à Carrières-sous Poissy (78)


# Comment

En géolocalisant tous les points de passage de mes parcours et en me servant d'un API Google Maps permettant de tracer une ligne brisée sur une carte.
La version actuelle optimise la saisie des points dans un `Array` afin de saisir le premier et dernier point d'une suite. Elle calcule aussi le centre du parcours pour centrer la carte.


# Mais pourquoi ?

A l'heure où j'écris la troisième version de ce ReadMe, ça me paraît toujours nécessaire car la géolocalisation GoogleFit n'est pas parfaite. Beaucoup de séances ont été perdus et ont du être retracées proprement.
Je suis désormais sur la re-saisie de l'intégralité des séances précédentes pour avoir une homogénéïté des représentations.


# Et ensuite ?

*Suite au changement de politique dans l'utilisation des API Google Maps, je vais devoir passer à un outil de cartographie libre de type OpenStreetMap*
Cela m'impose de réétudier mon code pour l'adapter à cette nouvelle API



