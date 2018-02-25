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

  seance = [1..16,100..102,18..36,144,140..143,150..156,56..68,71..73,111,110,119..132]
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

  perimetrie     = poi.decode [1..36,144,44..70,75..83,1]
  vieilleFerme   = poi.decode [8,88..93,96]
  path1          = poi.decode [9,94..99,78]
  path2          = poi.decode [20,118..132,2]
  path3          = poi.decode [14,107..111,73,70]
  mare           = poi.decode [108,112..117,121,133..136,98]
  pontonSeine    = poi.decode [16,100..102,18]
  maisonInsectes = poi.decode [68,71..75]
  observatoire   = poi.decode [84,103..106,24..22,84..87,65]
  path4          = poi.decode [35,137..143,150..148,48,49,148]
  pathButte      = poi.decode [140,144..147,143]
  galiotte       = poi.decode [150..168,84,21]
  pathABCD       = poi.decode [156,56..58,159]

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
