class Requirement < ActiveRecord::Base
  def self.sorted_by(field)
     Requirement.order("name")
  end
  def self.search(searching)
     Requirement.where("name LIKE ?", "%#{searching}%")
  end
end
