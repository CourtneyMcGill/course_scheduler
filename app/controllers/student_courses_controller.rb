class StudentCoursesController < ApplicationController
  def create
    @student=Student.find(params[:student_id])
    @course=Course.find(params[:course_id])
    @student.courses<< @course
    flash[:notice]= "#{@student.first} added to #{@course.course_name}"
    redirect_to student_courses_path
  end
  def index
    @student=Student.find(params[:student_id])
    @courses=Course.all()
  end
  def destroy
    @student=Student.find(params[:student_id])
    @course=Course.find(params[:id])
    @student.courses.delete(@course)
    flash[:notice]="#{@student.first} removed from #{@course.course_name}"
    redirect_to student_path
  end
end
