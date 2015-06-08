class Wiki
  require 'wikipedia'

  def self.verify_person(name)
    Wikipedia.find(name.titleize)
  end

end
