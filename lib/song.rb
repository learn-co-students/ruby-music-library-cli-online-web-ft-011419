require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = self.artist=(artist) if artist != nil
    @genre = self.genre=(genre) if genre != nil
  end

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
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

  def self.count
    @@all.size
  end

  def artist=(artist)
    @artist ||= artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre ||= genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
