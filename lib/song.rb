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

  def self.find_by_name(song_name)
    self.all.detect {|song| song_name == song.name}
  end

  def self.find_or_create_by_name(song_name)
    found_song = self.find_by_name(song_name)
    found_song ? found_song : self.create(song_name)
  end

  def self.new_from_filename(filename)
    artist_and_song = filename.split(" - ")
    new_song = artist_and_song[1]
    new_artist = Artist.find_or_create_by_name(artist_and_song[0])
    split_genre = artist_and_song[2].split(".mp3")
    new_genre = Genre.find_or_create_by_name(split_genre[0])
    if self.find_by_name(artist_and_song[1]) == nil
      self.new(new_song, new_artist, new_genre)
    end
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
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
