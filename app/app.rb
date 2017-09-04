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
  s01 = [48.942315,2.012200]
  s02 = [48.941966,2.010703]
  s03 = [48.941329,2.005202]
  s04 = [48.941103,2.004819]
  s05 = [48.939622,2.005587]
  s06 = [48.937054,2.007394]
  s07 = [48.934868,2.009963]
  s08 = [48.933939,2.010914]

  slim :map, locals: { my_api_key: key,
                           point0: origin,
                             zoom: 15,
                              s01: s01,
                              s02: s02,
                              s03: s03,
                              s04: s04,
                              s05: s05,
                              s06: s06,
                              s07: s07,
                              s08: s08        }

end

get '/all' do
# Not working yet



  slim :all, locals: { my_api_key: key,
                       my_api_css: map_css,
                             zoom: 14,
                              all: poi.coordonnees
                     }

end
