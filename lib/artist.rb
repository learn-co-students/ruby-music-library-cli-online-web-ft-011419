class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :songs
  def initialize(name)
    @name = name
    @songs = []
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
  def add_song(song)
    unless @songs.include?(song)
       @songs << song
    end
    if song.artist == 'none'
      song.artist = self
    end
  end
  def genres
    @songs.collect {|song| song.genre}.uniq
  end
end
