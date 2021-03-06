class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def github
    #p request.env["omniauth.auth"]
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "github"
      session[:user_id] = @user.id
      sign_in_and_redirect @user, :event => :authentication
      redirect_to root
    else
      session["devise.user_attributes"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def logout
    @user = User.from_omniauth(request.env["omniauth.auth"])

    #destroy any created session info (blow up 'user_id' and 'devise.user_attributes')
    
    @user.destroy
  end

end
