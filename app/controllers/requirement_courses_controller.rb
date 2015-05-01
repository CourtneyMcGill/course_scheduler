class RequirementCoursesController < ApplicationController
  def create
    @requirement=Requirement.find(params[:requirement_id])
    @course=Course.find(params[:course_id])
    @requirement.courses<< @course
    flash[:notice]= "#{@course.course_name} added to #{@requirement.name}"
    redirect_to requirement_courses_path
  end
  def index
    @requirement=Requirement.find(params[:requirement_id])
    @courses=Course.all()
  end
  def destroy
    @requirement=Requirement.find(params[:requirement_id])
    @course=Course.find(params[:id])
    @requirement.courses.delete(@course)
    flash[:notice]="#{@course.course_name} removed from #{@requirement.name}"
    redirect_to :back
  end
end
