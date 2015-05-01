class Student < ActiveRecord::Base
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :requirements

  def self.sorted_by(field)
	if self.column_names.include?(field)
          if field == "first"
       	    self.order("LOWER(first)")
          elsif field == "last"
            self.order("LOWER(last)")
          elsif field == "major"
            self.order("LOWER(major)")
          else
            self.order(field)
          end
        else
          self.order("LOWER(last)")
        end
  end

  def self.search(string)
        Student.where("sid like ?", "%#{string}%")
  end

end
