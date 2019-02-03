require "pry"
class Artist
attr_accessor :name ,:songs, :genres
extend Concerns::Findable
@@all=[]
    def initialize(name=nil)
      @name = name
    #  @@all << self
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

      end
      def self.create(name)
          art=self.new(name)
      @@all <<art
      art
      end

      def add_song(song)
          song.artist || song.artist=self

       @songs<< song unless @songs.include?(song)
        end
        def genres
          @songs.map(&:genre).uniq

        end


end
