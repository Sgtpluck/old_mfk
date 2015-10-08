class Wiki
  require 'httparty'
  attr_reader :name, :url

  def initialize(name)
    @name = name.titleize.gsub(' ', '_')
    @url = ""
  end

  def sanitize_photo_array(imageArray)
    imageArray.select! do |image|
      !(image["title"] =~ /Commons/ || image["title"] =~/Padlock/)
    end
    add_photo(imageArray[0]["title"])
  end

  def add_photo(image)
    imageInfo = HTTParty.get("https://en.wikipedia.org/w/api.php?action=query&format=json&titles=File:RyanGosling07TIFF.jpg&prop=imageinfo&&iiprop=url")
    if imageInfo["query"]["pages"] != "-1"
      @url = imageInfo["query"]["pages"].values[0]["imageinfo"][0]["url"]
    end
  end

  def verify_person
    person = HTTParty.get("https://en.wikipedia.org/w/api.php?action=query&format=json&prop=revisions&titles=#{@name}&prop=images")
    if person["query"]["pages"].keys[0] == "-1"
      @name = nil
    else
      sanitize_photo_array(person["query"]["pages"].values[0]["images"])
    end
    return self
  end

end
