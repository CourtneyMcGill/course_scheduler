class Planner::StudentPlansController < ApplicationController
  def create
    @student=Student.find(params[:student_id])
    @plan = Plan.new
    @plan.course_id = params[:course_id]
    @plan.save()
    @student.plans<< @plan
    flash[:notice]= "Added your plan!"
    redirect_to planner_students_path
  end
  def index
    @student=Student.find(params[:student_id])
    @courses=Course.all()
  end
  def destroy
    @student=Student.find(params[:student_id])
    @plan=Plan.where("course_id = ?", params[:id])
    @student.plans.delete(@plan)
    flash[:notice]="Removed your plan!"
    redirect_to :back
  end
end
