class CoursesController < ApplicationController

  def index
        if params[:sort] != nil
            query = params[:sort]
        else
            query = "crn"
        end


        if params[:commit] == "Filter courses"
				filterStr = buildFilterString()
				@courses = filterStr ? Course.filter(filterStr) : Course.sorted_by(query)
		  else
			   @courses = Course.sorted_by(query)

		  end 






=begin       if params[:courses_search] != nil
            searchfield = params[:courses_search]
            @courses = searchfield ? Course.search(searchfield) : Course.sorted_by(query)

        else
            @courses = Course.sorted_by(query)
=end

  end



  def show
	@course = Course.find(params[:id])
  end

  def new
        @course = Course.new
  end

  def buildFilterString
		paramList = {'dept' => params[:dept], 'instructor' => params[:instructor], 'level' => params[:level], 'days' => params[:days], 'after' => params[:after], 'before' => params[:before]}
		string = ""
	   paramNum = 0
		paramList.each { |key, val|
			if val.length != 0
            paramNum += 1
            if paramNum > 1
					string << "AND "
				end
				if key == "level"
               val = val.to_i.round(-2).to_s
					string << "(#{key} - '#{val}') < 100 AND (#{key} - '#{val}') > 0 "
				elsif key == "before"
					string << "starts <= '#{val}' "
				elsif key == "after"
					string << "starts >= '#{val}' " 
				else
					string << "#{key} like '#{val}' "
				end
			end
		}
		return string
  end

  def roundLevels(level)
      byebug
		if level.length > 0
         byebug
			level = level.to_i.round(-2).to_s
      end
      byebug
		return level
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
        params.require(:course).permit(:dept, :level, :crn, :course_name, :title, :instructor, :days, :starts, :ends, :building_room, :credits, :coreq, :crosslist, :restrictions, :prereq, :notes)
  end

end
