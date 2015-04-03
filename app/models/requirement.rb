class Requirement < ActiveRecord::Base
  def self.sorted_by(field)
     Requirement.order("name")
  end
end
