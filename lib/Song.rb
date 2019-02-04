class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    name = self.new(name)
    name.save
    name
  end
  
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name)||create(name) 
  end
  
  def self.new_from_filename(filename)
    new_file = filename.split(" - ")
    artist=Artist.find_or_create_by_name(new_file[0])
    genre=Genre.find_or_create_by_name(new_file[2].gsub(".mp3",  ""))
    song=new(new_file[1], artist, genre)
    song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
    end
    
  def to_S
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end
