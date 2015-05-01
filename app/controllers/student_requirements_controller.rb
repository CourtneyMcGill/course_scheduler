class StudentRequirementsController < ApplicationController
  def create
    @student=Student.find(params[:student_id])
    @requirement=Requirement.find(params[:requirement_id])
    @student.requirements<< @requirement
    flash[:notice]= "#{@student.first} added to #{@requirement.name}"
    redirect_to student_requirements_path
  end
  def index
    @student=Student.find(params[:student_id])
    @requirements=Requirement.all()
  end
  def destroy
    @student=Student.find(params[:student_id])
    @requirement=Requirement.find(params[:id])
    @student.requirements.delete(@requirement)
    flash[:notice]="#{@student.first} removed from #{@requirement.name}"
    redirect_to (:back)
  end
end
