class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    @files ||= Dir.chdir(@path) do
      Dir.glob('*.mp3')
    end
  end

  def import 
    files.each {|filename| Song.create_from_filename(filename)}
  end 

end
