class RequirementsController < ApplicationController

  def index
    searchfield = params[:requirements_search]
    @requirements = searchfield ? Requirement.search(searchfield) : Requirement.sorted_by("name")
  end


  def show
    @requirement = Requirement.find(params[:id])
  end

  def new
    @requirement = Requirement.new
  end

  def create
    @requirement = Requirement.new(create_update_params)
    if @requirement.save
        flash[:notice] = "New requiremenent #{@requirement.name} created successfully"
        redirect_to requirement_courses_path(@requirement)
    else
        flash[:warning] = "Your new requirement was not uploaded"
        redirect_to new_requirement_path
    end
  end

  def edit
    @requirement = Requirement.find(params[:id])
  end      

  def update
    @requirement = Requirement.find(params[:id])
    @requirement.update(create_update_params)
    if @requirement.save
        flash[:notice] = "#{@requirement.name} successfully updated"
        redirect_to requirement_path(@requirement)
    else
        flash[:warning] = "The requirement was NOT updated!"
        redirect_to edit_requirement_path(@requirement)
    end
  end

  def destroy
    @requirement = Requirement.find(params[:id])
    @requirement.destroy
    flash[:notice] = "Requirement- #{@requirement.name} deleted."
    redirect_to requirements_path
  end

private
  def create_update_params
        params.require(:requirement).permit(:name)
  end
end
