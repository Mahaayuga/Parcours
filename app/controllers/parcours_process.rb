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

    @poi.each do |n|
      mycoord[i] = [n.lat, n.lng]
      i += 1
    end
    return mycoord
  end

  def monparcours(arrListe)
    itineraire = ''

    arrListe.each do |n|
      itineraire += "{lat: #{@poi[n].lat}, lng: #{@poi[n].lng}},\n"
    end
    itineraire = itineraire.slice(0, itineraire.length - 2)
  end

  # calcul du cadre
  def moncadre(arrListe)
    perimetre = { nord: nil,   sud: nil,
                   est: nil, ouest: nil  }

    arrListe.each do |n|
      perimetre[:nord]  = @poi[n].lat if perimetre[:nord].nil?  || perimetre[:nord]  < @poi[n].lat
      perimetre[:ouest] = @poi[n].lng if perimetre[:ouest].nil? || perimetre[:ouest] < @poi[n].lng
      perimetre[:sud]   = @poi[n].lat if perimetre[:sud].nil?   || perimetre[:sud]   > @poi[n].lat
      perimetre[:est]   = @poi[n].lng if perimetre[:est].nil?   || perimetre[:est]   > @poi[n].lng
    end

    return pointzero = { lat: gravite([perimetre[:nord],  perimetre[:sud]]),
                         lng: gravite([perimetre[:ouest], perimetre[:est]])  }

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

end
