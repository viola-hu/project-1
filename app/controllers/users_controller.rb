class UsersController < ApplicationController
  # show form to create a new account
  def new
    @user = User.new
  end

  def create
    # User.create returns: the new User object itself / nil(failed)
    @user = User.create params_user
    # has the new user been saved successfully in DB?
    if @user.persisted?
      # if true, log the user in!
      session[:user_id] = @user.id
      flash[:success] = "You've created an account successfully!"
      redirect_to categories_path
    else
      # if false, DB will bounce back errors, show errors to user
      flash[:errors] = @user.errors.full_messages
      # render the signup page with previous input prefilled
      render :new
    end
  end



  def show
  end

  def edit
  end

  def udpate
  end

  def destroy
  end

  private

  def params_user
    # params[:user]'s value is a nested hash inside params parent hash
    # filter this nested hash's key by '.permit'
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
