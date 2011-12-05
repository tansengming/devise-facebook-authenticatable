class UsersController < ApplicationController
  def sign_in
    redirect_to :action => 'welcome' if user_signed_in?
  end

  def welcome
  end
end
