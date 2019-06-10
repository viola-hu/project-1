class SessionController < ApplicationController
  def new
  end

  def create

    user = User.find_by email: params[:email]

    if user.present? && user.authenticate(params[:password])
      # successful login
      session[:user_id] = user.id
      # redirect to homepage
      redirect_to root_path
    else
      # failed login
      flash[:error] = 'Wrong email address or password'
      # redirect to login page
      redirect_to login_path
    end
  end

  def destroy
    # reset session key to nil, log user out
    session[:user_id] = nil
    # sent farewell message
    flash[:success] = "You've logged out. Hope to see you soon!"
    # redirect to homepage
    redirect_to root_path
  end
end
