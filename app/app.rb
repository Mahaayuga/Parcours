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

  un_test = 173.upto(198).to_a

  origin = {lat: poi.moncadre(un_test)[:lat],
            lng: poi.moncadre(un_test)[:lng]  }

  slim :map, locals: { my_api_key: key,
                       my_api_css: map_css,
                           origin: origin,
                             zoom: 15,
                mon_joli_parcours: poi.monparcours(un_test)  }
end

get '/all' do

  slim :all, locals: { my_api_key: key,
                       my_api_css: map_css,
                             zoom: 14,
                              all: poi.coordonnees  }
end

get '/pph' do

  slim :pph, locals: { my_api_key: key,
                       my_api_css: map_css,
                             zoom: 15,
                              all: poi.coordonnees  }
end
