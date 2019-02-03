require 'pry'
class Song
  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre
  def initialize(name, artist = 'none', genre = 'none')
    @name = name
    self.genre = genre
    self.artist = artist
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  def artist=(artist)
    @artist = artist
    if artist.class() == Artist
      artist.add_song(self)
    end
  end
  def genre=(genre)
    @genre = genre
    if genre.class() == Genre
      genre.add_song(self)
    end
  end
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  def self.new_from_filename(filename)
    file_array = filename[0..-5].split(' - ')
    new_song = self.find_or_create_by_name(file_array[1])
    new_song.artist = Artist.find_or_create_by_name(file_array[0])
    new_song.genre = Genre.find_or_create_by_name(file_array[2])
    new_song
  end
  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
