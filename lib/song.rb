
class Song
attr_accessor :name, :artist ,:genre
@@all=[]
    def initialize(name, artist=nil,genre=nil)
      @name = name
      @@all << self

      self.artist=(artist)
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
        song=self.new(name)
    @@all << song
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


end
