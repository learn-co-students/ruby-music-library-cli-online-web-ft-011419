class Song
attr_accessor :name, :artist ,:genre
@@all=[]
    def initialize(name, artist=nil,genre=nil)
      @name = name
      @@all << self
      @artist=artist
      @genre = genre
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



end
