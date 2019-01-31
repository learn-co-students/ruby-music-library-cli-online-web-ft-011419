class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist=(artist)
    @artist = artist
    unless @artist == nil
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    unless @genre == nil
      genre.songs << self unless genre.songs.include?(self)
    end
  end

  def genre
    @genre
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
    new_song = Song.new(name)
    new_song.save
    new_song
  end

end
