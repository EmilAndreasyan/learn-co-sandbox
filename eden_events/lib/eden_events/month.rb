class EdenEvents::Month
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    @@all
end

  def save
    @@all << self
  end
end