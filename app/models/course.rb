class Course < ActiveRecord::Base

  def self.sorted_by(field)
	if self.column_names.include?(field)
       	  self.order(field)
        else
          self.order("course_name")
        end
  end

end
