class Genre
  extend Standard::ClassMethods
  include Standard::InstanceMethods
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre ||= self
  end
  
  def artists
    @songs.collect { |song| song.artist }.uniq
  end
  
end