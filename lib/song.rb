require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize (name = nil, artist_name = nil)
    @name = name 
    @artist_name = artist_name 
  end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create 
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == name
     Song.find_by_name(name)
    else
    Song.find_by_name(name) != name
      song = Song.create_by_name("name")
      self
    end

end


end

# song=Song.new("mememe")
# binding.pry