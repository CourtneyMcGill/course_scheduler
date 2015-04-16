class CoursesController < ApplicationController

  def index
        if params[:sort] != nil
            query = params[:sort]
#            @courses = Course.sorted_by(params[:sort])
        else
            query = "crn"
#            @courses = Course.sorted_by("crn")
        end
        if params[:courses_search] != nil
            searchfield = params[:courses_search]
            @courses = searchfield ? Course.search(searchfield) : Course.sorted_by(query)

        else
            @courses = Course.sorted_by(query)
        end

  end



  def show
	@course = Course.find(params[:id])
  end

  def new
        @course = Course.new
  end

  def buildQueryString
  end

  def create
        c = Course.new(safe_params)
        if c.save
            flash[:notice] = "Course #{c.title} successfully created"
            redirect_to courses_path
        else
            flash[:warning] = "Course couldn't be created"
            redirect_to new_course_path
        end
  end

  def edit
        @course = Course.find params[:id]
  end

  def update
        @course = Course.find params[:id]
        @course.update(safe_params)
        flash[:notice] = "#{@course.title} was successfully updated"
        redirect_to course_path(@course)
  end

  def destroy
        @course = Course.find(params[:id])
        @course.destroy
        flash[:notice] = "Course- #{@course.title} deleted"
        redirect_to courses_path
  end

  private
  def safe_params
        params.require(:course).permit(:crn, :course_name, :title, :instructor, :days, :starts, :ends, :building_room, :credits, :coreq, :crosslist, :restrictions, :prereq, :notes)
  end

end
