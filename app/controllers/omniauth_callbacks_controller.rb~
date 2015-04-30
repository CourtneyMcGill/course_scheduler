class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #before_action :authenticate_user!
  def github
    #p request.env["omniauth.auth"]
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = "Successful authentication via github"
      sign_in_and_redirect @user #, :event => :authentication
    else
      session["devise.user_attributes"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
      #flash[:warning] = "Invalid login, try again or create an account on github"
    end
  end
  
end
