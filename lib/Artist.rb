require "pry"
class Artist
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
  
  def add_song(song)
    if song.artist != self
       song.artist = self
    end
    
    @songs << song unless @songs.include?(song)
    #binding.pry
  end
  
  def genres
    songs.map {|song| song.genre}.uniq
  end
  
end