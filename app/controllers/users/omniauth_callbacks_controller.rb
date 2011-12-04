class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_or_create_by_facebook(request.env["omniauth.auth"])
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in :user, @user, :event => :authentication
      render 'shared/close_popup'
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      flash[:error] = "There was a problem with logging in. Please try again."
      render :text => "There was a problem with logging in. Please try again."
    end
  end

  def failure
    flash[:error] = "There was a problem with logging in. Please try again."
    render :text => "There was a problem with logging in. Please try again."
  end
end