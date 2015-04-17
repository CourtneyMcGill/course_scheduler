class Course < ActiveRecord::Base
  has_many :students
  belongs_to :requirements

  def self.sorted_by(field)
      if self.column_names.include?(field)
          if field == "course_name"
              self.order("LOWER(course_name)")
          elsif field == "title"
              self.order("LOWER(title)")
       	  self.order(field)
          elsif field == "instructor"
              self.order("LOWER(instructor)")
          elsif field == "building_room"
              self.order("LOWER(building_room)")
          else
              self.order(field)
          end
      else
          self.order("LOWER(course_name)")
      end
  end

  def self.search(string)
     Course.where("crn like ?", "%#{string}%")
  end

end

