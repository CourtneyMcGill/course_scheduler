class Student < ActiveRecord::Base
  has_many :courses


  def self.sorted_by(field)
	if self.column_names.include?(field)
       	  self.order(field)
        else
          self.order("last")
        end
  end

  def self.search(string)
        Student.where("first like ?", "%#{string}%")
  end

end
