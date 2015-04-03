class StudentsController < ApplicationController

  def index
	@students = Student.sorted_by("last")
  end
  def show
	@student = Student.find(params[:id])
  end
end

