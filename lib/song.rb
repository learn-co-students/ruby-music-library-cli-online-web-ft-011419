class Song

  attr_accessor :name, :artist, :genre

@@all = []

  def initialize(name, artist = "")
    @name = name
    @artist = artist
    @genre = genre

  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.destroy_all
    @@all.clear
  end

end
