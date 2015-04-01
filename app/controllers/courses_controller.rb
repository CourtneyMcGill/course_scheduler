class CoursesController < ApplicationController

  def index
	@courses = Course.sorted_by("crn")
  end

  def show
	@course = Course.find(params[:id])
  end

end
