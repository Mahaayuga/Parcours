require_relative 'controllers/parcours_process'

#chargement des poi
poi = Poi.new
poi.mise_en_memoire("../db/db_poi.csv")

#poi.liste

#Test de récupération d'un text
#ghostkey = KeyLoad.new
#puts ghostkey.loadkey("../key")

#test d'un calcul de moyenne
#mescoord = [50, 48, 51, 45]
#p poi.gravite(mescoord)

#origin = {lat: 48.938127, lng: 2.008509}
#p origin[:lat] , origin[:lng]

#test collecte des points
#run = [0,1,3]
#puts poi.monparcours(run)

puts poi.coordonnees
