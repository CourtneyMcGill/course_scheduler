class Plan < ActiveRecord::Base

  has_and_belongs_to_many :students

  def self.search(string)
    PlansStudent.where("student_id = ?", "%#{string}%")
  end

  def toCourse()
    return Course.find(course_id)
  end

end
