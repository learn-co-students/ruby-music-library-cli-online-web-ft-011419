require "pry"
class Song
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    
    if genre != nil
      self.genre = genre
    end
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self unless @@all.include?(self)
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    @@all << song
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.new_from_filename(file)
    song = find_or_create_by_name(file.split(" - ")[1])
    artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    genre = Genre.find_or_create_by_name(file.split(" - ")[2].split(".")[0])
    #binding.pry
    
    song.artist = artist
    song.genre = genre
    song
  end
  
  def self.create_from_filename(file)
    song = new_from_filename(file)
    song.save
  end
    
end