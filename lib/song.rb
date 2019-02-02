require 'pry'

class Song

  

  attr_accessor :name, :genre, :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name)
    song.save
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    artist_n = arr.first
    name = arr[1]
    genre_n = arr[2].gsub(".mp3", "")
    song = self.find_or_create_by_name(name)
    song.artist = Artist.find_or_create_by_name(artist_n)
    song.genre = Genre.find_or_create_by_name(genre_n)
    song
  end


  def self.find_by_name(name)
      self.all.detect {|song| song.name == name}
    end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end



end
