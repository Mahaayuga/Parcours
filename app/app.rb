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

  origin = {lat: 48.938127,lng: 2.008509}

  slim :map, locals: { my_api_key: key,
                       my_api_css: map_css,
                             zoom: 15,
                              all: poi.coordonnees
       }

end

get '/all' do

  slim :all, locals: { my_api_key: key,
                       my_api_css: map_css,
                             zoom: 14,
                              all: poi.coordonnees
                     }
end

get '/pph' do

  slim :pph, locals: { my_api_key: key,
                       my_api_css: map_css,
                             zoom: 15,
                              all: poi.coordonnees
                     }
end
