class MusicImporter
  attr_accessor :path
  
  @@all = []
  
  def initialize(path)
    @path = path
  end
  
  def self.save
    self.class.all << self
  end
  
  def files
    @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
  end
  
  def import
    files.each{|binder| Song.create_from_filename(binder)}
end
end
