class Genre
attr_accessor :name
@@all=[]
    def initialize(name=nil)
      @name = name
      @@all << self
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
          grn=self.new(name)
      @@all <<grn
      grn
      end


end
