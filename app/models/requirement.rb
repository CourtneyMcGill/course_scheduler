class Requirement < ActiveRecord::Base
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :students
  
  def self.sorted_by(field)
     Requirement.order("name")
  end

  def self.search(string)
     Requirement.where("name like ?", "%#{string}%")
  end
end
