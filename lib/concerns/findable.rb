module Concerns::Findable

  def find_by_name(name)
    self.all.detect {|a| name == a.name}
  end

  def find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    found_song ? found_song : self.create(name)
  #   if found_song
  #     found_song
  #   else
  #     new = self.new(name)
  #     new.save
  #     new
  #   end
  end
end
