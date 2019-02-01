class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @mp3files = Dir.entries(@path).select {|file| !File.directory? file}
  end

  def import
    self.files.each do |files|
      Song.create_from_filename(files)
    end
  end


end
