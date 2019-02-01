class MusicImporter
  
  attr_reader :path, :files
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files ||= Dir.chdir(@path) { Dir.glob("*.mp3") }
  end
  
  def import
    self.files.each { |file| Song.create_from_filename(file) }
  end
  
end