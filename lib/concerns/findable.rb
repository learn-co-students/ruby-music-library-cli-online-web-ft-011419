module Concerns::Findable
  # Module code here
  def find_by_name(name)
    all.detect {|song| song.name == name}
  end
    
  def find_or_create_by_name(name)
    if find_by_name(name)
      return find_by_name(name)
    else
      create(name)
    end
  end
  
end