class MusicImporter

attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
  Dir.chdir(@path) do | path |
          Dir.glob("*.mp3")
      end
  end

  def import
    @file_import = self.files
    @file_import.each do |song|
      Song.create_from_filename(song)
    end
  end
end
