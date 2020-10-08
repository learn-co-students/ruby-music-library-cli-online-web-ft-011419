module Concerns::Findable
  def find_by_name(song)
    self.all.find {|x| x.name == song}
  end
  def find_or_create_by_name(song)
    find_by_name(song) || self.create(song) unless self.all.include?(song)
  end
end
