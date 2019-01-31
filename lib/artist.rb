class Artist
attr_accessor :name ,:songs
@@all=[]
    def initialize(name=nil)
      @name = name
      @@all << self
      @songs =[]
    end

      def self.all
      @@all
      end
      def self.destroy_all
      @@all.clear
      end
      def save
        @@all << self
        self
      end
      def self.create(name)
          art=self.new(name)
      @@all <<art
      art
      end

      def add_song
        @songs<<self

      end


end
