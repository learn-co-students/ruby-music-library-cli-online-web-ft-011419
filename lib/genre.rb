class Genre
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
    if song.genre == 'none'
      song.genre = self
    end
  end
  def artists
    @songs.collect {|song| song.artist}.uniq
  end
end
