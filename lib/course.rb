class Course
  attr_accessor :title, :schedule, :description
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all 
    @@all
  end
<<<<<<< HEAD
  
  def self.reset_all
    @@all.clear
  end
=======
>>>>>>> b1fa8fc9c3d666b9a1830a56eb8a04c325862616
end