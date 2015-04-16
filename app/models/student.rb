class Student < ActiveRecord::Base
  has_many :courses


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
        Student.where("first like ?", "%#{string}%")
  end

end
