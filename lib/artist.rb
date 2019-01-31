require "pry"

class Artist
  attr_accessor :name, :songs
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    unless @songs.include?(song)
      @songs << song
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end
end
