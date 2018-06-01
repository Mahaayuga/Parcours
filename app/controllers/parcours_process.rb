require 'csv'

class Poi
  K_LAT = 2.557 / 0.023
  K_LNG = 3.651 / 0.050


  def initialize
    @poi = []
  end

  def mise_en_memoire(csv_file_name)
    CSV.foreach(csv_file_name) do |row|
      @poi << CSVReader.new(row[0], row[1], row[2], row[3], row[4])
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
      itineraire += "[#{@poi[n].lat}, #{@poi[n].lng}],\n"
    end
    itineraire = itineraire.chop.chop
  end

  #Simplification synthaxique
  def decode(arrListe)
    tab = []

    arrListe.each do |n|
      n = analyse n if n.is_a?(Range)
      tab << n
    end
    return tab.flatten
  end

  def analyse(data)
    t = data.to_s.split('..').map(&:to_i)
    t[0] < t[1] ? (t[0]..t[1]).to_a : (t[1]..t[0]).to_a.reverse
  end

  # Calcul de la distance
  def distance(arrListe)
    km = 0
    arrListe.each_with_index do |val, index|
      km += dist @poi[val], @poi[arrListe[index.next]] unless arrListe[index.next] == nil
    end
    return km.round(3)
  end

  def dist(a,b)
    result = Math.sqrt( ((a.lat - b.lat).abs * K_LAT)**2 + ((a.lng - b.lng).abs * K_LNG)**2 )
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
  attr_reader :index, :lat, :lng, :alt, :txt

  def initialize (index, lat, lng, alt, txt)
    @index = index.to_i
    @lat   = lat.to_f
    @lng   = lng.to_f
    @alt   = alt.to_f
    @txt   = txt.to_s
  end

end
