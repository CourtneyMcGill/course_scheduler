class Student < ActiveRecord::Base

  def self.sorted_by(field)
	if self.column_names.include?(field)
       	  self.order(field)
        else
          self.order("name")
        end
  end

end
