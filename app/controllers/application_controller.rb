class ApplicationController < ActionController::Base

  before_action :fetch_user

  private
   # purpose of fetch_user
   # 1) if the user is still logged in when sending the request
   # 2) if the user's account still exists in DB
   # 3) store this user account/ User instance information in a variable for further purpose in child controllers
  def fetch_user
    # check if a user is logged in
    if session[:user_id].present?
      # return value could be a valid User object or nil (deleted account)
      @current_user = User.find_by id: session[:user_id]
    end

    # clear out session key/log out user in case it's a deleted account
    session[:user_id] = nil unless @current_user.present?
  end


  # no need of before_action, as some pages/requests sent from user don't require user authentication, i.e. available to everyone
  # call this method controller by controller
  def check_if_logged_in
    unless @current_user.present?
      # either un-logged-in or account deleted
      flash[:error] = "Please login to view the page."
      # redirect to login page
      redirect_to login_path
    end
  end
end
