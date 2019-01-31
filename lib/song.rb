class Song

extend Concerns::Findable

  attr_accessor :name, :artist, :genre

@@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
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
    if artist != nil
    artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre != nil
    genre.add_song(self)
    end
  end

  def self.new_from_filename(filename)
    artist_n_song = filename.split(" - ")
    song = self.find_or_create_by_name(artist_n_song[1])
  song.genre = Genre.find_or_create_by_name(artist_n_song[2].split(".").shift)
  song.artist =  Artist.find_or_create_by_name(artist_n_song[0])
  song
  end

  def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  song

  end

  def self.destroy_all
    @@all.clear
  end

end
