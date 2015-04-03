class Requirement < ActiveRecord::Base
 has_many :courses
 def self.sorted_by(field)
     Requirement.order("name")
  end
  def self.search(searching)
     Requirement.where("name LIKE ?", "%#{searching}%")
  end
end
