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
  
  def add_song(song)
    if song.genre != self
      song.genre = self
    end
    
    if @songs.include?(song)
      
    else
      @songs << songs
    end
  end
  
  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
end