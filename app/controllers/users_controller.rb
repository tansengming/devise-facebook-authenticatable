class UsersController < ApplicationController
  def sign_in
    redirect_to :action => 'welcome' if user_signed_in?
  end

  def welcome
    redirect_to :action => 'sign_in' unless user_signed_in?
  end
end
