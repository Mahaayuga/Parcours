require 'sinatra'
require 'slim'
require_relative 'controllers/parcours_process'

#chargement des poi
poi = Poi.new
poi.mise_en_memoire("../db/db_poi.csv")

#chargement de la licence Maps
key = IO.read("../key")

get '/' do

  seance = [0]
  seance = poi.decode seance

  km = poi.distance seance

  origin = {lat: poi.moncadre(seance)[:lat],
            lng: poi.moncadre(seance)[:lng]  }

  slim :map, locals: { my_api_key: key,
                       my_api_css: 'mapbox.light',
                           origin: origin,
                             zoom: 14,
                               km: km,
                            recap: "",
                mon_joli_parcours: poi.monparcours(seance)  }
end

post '/' do
  seance = params[:parcours]
  seance = eval( seance )
  seance = poi.decode seance

  km = poi.distance seance

  origin = {lat: poi.moncadre(seance)[:lat],
            lng: poi.moncadre(seance)[:lng]  }

  slim :map, locals: { my_api_key: key,
                       my_api_css: 'mapbox.light',
                           origin: origin,
                             zoom: 14,
                               km: km,
                            recap: params[:parcours],
                mon_joli_parcours: poi.monparcours(seance)  }
end


get '/all' do

  tous = (0..199).to_a

  origin = {lat: poi.moncadre(tous)[:lat],
            lng: poi.moncadre(tous)[:lng]  }
            
#'mapbox.light', 'mapbox.streets-satellite'
  slim :all, locals: { my_api_key: key,
                       my_api_css: 'mapbox.light',
                           origin: origin,
                             zoom: 15,
                              all: poi.coordonnees  }
end
