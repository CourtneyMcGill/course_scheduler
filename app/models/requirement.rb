class Requirement < ActiveRecord::Base
  def self.sorted_by(field)
     Requirement.order("name")
  end

  def self.search(string)
     Requirement.where("name like ?", "%#{string}%")
  end
end
