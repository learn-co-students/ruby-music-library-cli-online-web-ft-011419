class Genre
  attr_accessor :name

  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name=name
    # @@all << self
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
    genre = self.new(name)
    @@all << genre
    genre
  end

  def songs
    @songs
  end

  def artists
    artists = self.songs.collect do |song|
      song.artist
    end
    artists.uniq
  end
end
