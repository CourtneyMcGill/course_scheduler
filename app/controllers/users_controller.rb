class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:new]

  def index
     @users = User.all
     authorize User
     @users.destroy
  end

  def show
    @user = User.find(params[:id])
    @attempts = @user.get_attempts
    @problems = @user.get_problems
    authorize @user
  end


  def destroy
    @users = User.all
    authorize users
    @users.destroy
    redirect_to users_path, :notice => "Account for #{@user.name} successfully deleted."
  end

  private
     def secure_params
       params.require(:user)
     end

end
