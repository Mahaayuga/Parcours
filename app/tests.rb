require_relative 'controllers/parcours_process'

#chargement des poi
poi = Poi.new
poi.mise_en_memoire("../db/db_poi.csv")

#Test de récupération d'un text
#ghostkey = IO.read("./public/css/map.css")
#puts ghostkey

#test d'un calcul de moyenne  ## IT WORKS
#mescoord = [50, 48, 51, 45]
#puts poi.gravite(mescoord)

#origin = {lat: 48.938127, lng: 2.008509}
#p origin[:lat] , origin[:lng]

#test collecte des points  ## IT COULD WORK
run = [0..16,100..102,18..35,137..143,150..156,56..70,75..83]
run = poi.decode run

run_km = poi.distance run
puts run_km


=begin
puts poi.monparcours(run)
print "\n"
puts poi.moncadre(run)
=end

#print poi.coordonnees[0]

# 0.upto(poi.coordonnees.length-1) do |n|
#   print "#{poi.coordonnees.at(n)},\n"
# end

#print poi.coordonnees
#print poi.coordonnees.class

#poi.coordonnees.count.times do |i|
#  print "#{poi.coordonnees[i][1].to_f} \n"
#end

print "\n"
