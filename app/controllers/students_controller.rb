class StudentsController < ApplicationController

  def index
		if params[:sort]
			query = params[:sort]
		else
			query = 'last'
		end
		@students = Student.sorted_by(query)
	end

	def show
		@student = Student.find(params[:id])
	end

	def new
		@product = Student.new
		# you could also use a helper method here to pass new product through 
	end

	def create
		s = Student.new(safe_params)
		if s.save
			flash[:notice] = "Student #{s.first} successfully created"
			redirect_to students_path
		else
			flash[:warning] = "Student couldn't be created"
			redirect_to new_student_path
		end
	end

	def edit
		@student = Student.find params[:id]
	end

	def update
		@student = Student.find params[:id]
		@student.update(safe_params)
		flash[:notice] = "#{@student.first} was successfully updated."
		redirect_to student_path(@student)
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy
		flash[:notice] = "Student '#{@student.first}' deleted."
		redirect_to students_path
	end

	# caution: anything below the private call will be classified as private
	private
		def safe_params
			# we require a product to be in params
			# allow name, description, and price to be mass-assigned		
			params.require(:student).permit(:first, :last, :sid, :major)
		end

end

