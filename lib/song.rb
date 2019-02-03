
class Song
attr_accessor :name, :artist ,:genre
@@all=[]
    def initialize(name, artist=nil,genre=nil)
      @name = name
      #@@all << self

      self.artist=(artist)if artist
    self.genre=(genre)if genre
    end

    def self.all
    @@all
    end
    def self.destroy_all
    @@all.clear
    end
    def save
      @@all << self
    end
    def self.create(name)
        song = self.new(name)
        song.save
        song
    end
        def artist=(artist)
          @artist= artist
          @artist.add_song(self)if  artist
        end
        def genre=(genre)
          @genre=genre
          @genre.add_song(self)
        end
       def self.find_by_name(name)
       @@all.find {|a|a.name == name}

        end
       def self.find_or_create_by_name(name)
          find_by_name(name)|| create(name)
        end
    def self.new_from_filename(file_name)
           arr = file_name.split(" - ")

artist=Artist.find_or_create_by_name(arr[0])
genre=Genre.find_or_create_by_name(arr[2].gsub(".mp3", ""))
  song=new(arr[1],artist, genre )
  song
    end
def self.create_from_filename(file_name)
song=new_from_filename(file_name).save
song
end

end
