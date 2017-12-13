require 'sinatra'
require 'slim'
require_relative 'controllers/parcours_process'

#chargement des poi
poi = Poi.new
poi.mise_en_memoire("../db/db_poi.csv")

#chargement de la licence Maps
key = IO.read("../key")

#style de carte
map_css = IO.read("./public/css/map.css")

get '/' do

  seance = [0..9,94..99,78..71,68..41,169..197,196..169,41..20,118..121,133..136,98,99,79..83]
  seance = poi.decode seance

  km = poi.distance seance


  origin = {lat: poi.moncadre(seance)[:lat],
            lng: poi.moncadre(seance)[:lng]  }

  slim :map, locals: { my_api_key: key,
                       my_api_css: map_css,
                           origin: origin,
                             zoom: 14,
                               km: km,
                mon_joli_parcours: poi.monparcours(seance)  }
end

get '/all' do

  tous = (0..198).to_a

  origin = {lat: poi.moncadre(tous)[:lat],
            lng: poi.moncadre(tous)[:lng]  }

  slim :all, locals: { my_api_key: key,
                       my_api_css: map_css,
                           origin: origin,
                             zoom: 15,
                              all: poi.coordonnees  }
end

get '/pph' do

  pph = (0..168).to_a

  origin = {lat: poi.moncadre(pph)[:lat],
            lng: poi.moncadre(pph)[:lng]  }

  perimetrie     = (1..36).to_a + [144] + (44..70).to_a + (75..83).to_a << 1
  vieilleFerme   = [8] + (88..93).to_a << 96
  path1          = [9] + (94..99).to_a << 78
  path2          = [20] + (118..132).to_a << 2
  path3          = [14] + (107..111).to_a + [73, 70]
  mare           = [108] + (112..117).to_a + [121] + (133..136).to_a << 98
  pontonSeine    = [16, 100, 101, 102, 18]
  maisonInsectes = [68] + (71..75).to_a
  observatoire   = [84] + (103..106).to_a + [24, 23, 22] + (84..87).to_a << 65
  path4          = [35] + (137..143).to_a + [150, 149, 148, 48, 49, 148]
  pathButte      = [140] + (144..147).to_a << 143
  galiotte       = (150..168).to_a + [84, 21]
  pathABCD       = [156] + (56..58).to_a << 159

  slim :pph, locals: { my_api_key: key,
                       my_api_css: map_css,
                           origin: origin,
                             zoom: 16,
                       perimetrie: poi.monparcours(perimetrie),
                     vieilleFerme: poi.monparcours(vieilleFerme),
                            path1: poi.monparcours(path1),
                            path2: poi.monparcours(path2),
                            path3: poi.monparcours(path3),
                            path4: poi.monparcours(path4),
                             mare: poi.monparcours(mare),
                      pontonSeine: poi.monparcours(pontonSeine),
                   maisonInsectes: poi.monparcours(maisonInsectes),
                     observatoire: poi.monparcours(observatoire),
                        pathButte: poi.monparcours(pathButte),
                         galiotte: poi.monparcours(galiotte),
                         pathABCD: poi.monparcours(pathABCD)        }
end
