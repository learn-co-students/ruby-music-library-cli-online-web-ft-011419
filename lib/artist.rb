class Artist
    extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []



  def initialize(name)
    @name=name
    # @@all << self
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
     if !@@all.include?(self)
       @@all << self
     end
   end

  def self.create(name)
    artist = self.new(name)
    artist.save
    # @@all << artist
    artist
  end

  def genres
    genres = self.songs.collect do |song|
      song.genre
  end
  genres.uniq
end
end
