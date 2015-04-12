class RequirementsController < ApplicationController
  def index
    @requirements = Requirement.sorted_by("name")
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
        redirect_to requirements_path
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
    flash[:notice] = "Requirement #{@requirement.name} sucessfully deleted"
    redirect_to requirements_path
  end

private
  def create_update_params
        params.require(:requirement).permit(:name, :course)
  end
end
