module Concerns::Findable
  def find_by_name(name)
    self.all.detect { |song| song.name == name }
  end
  
  def find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
end

module Standard
  module InstanceMethods
    def save
      self.class.all << self
    end
  end
  
  module ClassMethods
    def destroy_all
      self.all.clear
    end
  
    def create(name)
      inst = self.new(name)
      inst.save
      inst
    end
  end
end