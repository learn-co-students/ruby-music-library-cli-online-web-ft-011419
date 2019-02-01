class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    @@all << song
    song
  end
  
  def artists
    songs.map { |song| song.artist }.uniq
  end
end