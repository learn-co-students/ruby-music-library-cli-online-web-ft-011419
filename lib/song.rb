class Song
  extend Standard::ClassMethods
  include Standard::InstanceMethods
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name, musician = nil, type = nil)
    @name = name
    @artist = self.artist=(musician) unless musician == nil
    @genre = self.genre=(type) unless type == nil
  end
  
  def artist=(artist)
    @artist ||= artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre ||= genre
    genre.add_song(self)
  end
  
  def self.new_from_filename(file_name)
    file_info = file_name.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file_info[0])
    genre = Genre.find_or_create_by_name(file_info[2])
    self.new(file_info[1], artist, genre)
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end
  
end