require 'csv'

class Poi
  def initialize
    @poi = []
  end

  def mise_en_memoire(csv_file_name)
    CSV.foreach(csv_file_name) do |row|
      @poi << CSVReader.new(row[0], row[1], row[2], row[3])
    end
  end

  def coordonnees
    mycoord = []
    i = 0

#   @poi.each do |n|
    @poi.each do |n|
      mycoord[i] = [n.lat, n.lng]
      i += 1
    end
    return mycoord
  end

  def monparcours(arrListe)
# WORKING ON THIS
    mylat = []
    mylng = []

    arrListe.each do |n|
      mylat << @poi[n].lat
      mylng << @poi[n].lng
    end

    puts mylat
    puts mylng

  end

  # calcul du 'milieu géographique du parcours'
  def gravite(arr)
    arr.inject{ |sum, el| sum + el }.to_f / arr.size
  end

  # calcul du zoom Maps
  def zoom
  end

end

class CSVReader
  attr_reader :index, :lat, :lng, :txt

  def initialize (index, lat, lng, txt)
    @index = index.to_i
    @lat   = lat.to_f
    @lng   = lng.to_f
    @txt   = txt.to_s
  end

#  def to_s
#    "#{@index}: #{@lat}, #{@lng} :: #{@txt}"
#  end

end
