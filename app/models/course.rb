class Course < ActiveRecord::Base
  has_many :students
  belongs_to :requirements

  def self.sorted_by(field)
      if self.column_names.include?(field)
       	  self.order(field)
      else
          self.order("course_name")
      end
  end

  def self.search(string)
     Course.where("crn like ?", "%#{string}%")
  end

end

