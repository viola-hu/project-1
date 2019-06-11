class RecipesController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show]


  def new
    @recipe = Recipe.new
  end

  def create

    # NOTE: we use .new and not .create because we might have to add the cloudinary image ID before we save this new item, thus we comment out [:image] in the strong params, in order to manually add this @recipe.image value from cloudinary
    @recipe = Recipe.new params_recipe

    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @recipe.image = req["public_id"]
    end
    # now that we have (maybe) added the image ID, we can save the new item to the database after adding the user_id field
    @recipe.user_id = @current_user.id
    @recipe.save

    if @recipe.persisted?
      # if saved into DB, redirect to recipe show page
      redirect_to recipe_path(@recipe.id)
    else
      # if not save, DB bounce back error!
      flash.now[:errors] = @recipe.errors.full_messages
      render :new
    end
  end


  def edit
    @recipe = Recipe.find params[:id]
  end

  def update
    @recipe = Recipe.find params[:id]

    # in UI elements, users can change recipe_id in the form,
    # and params carries this recipe_id
    # if the current_user is also the owner of the edited/new recipe_id, no problem, this user could initially change their own recipes
    # however, if the current_user is not the owner of the edited/new recipe_id, ERROR, bring them to homepage, cannot proceed to update recipe, using 'return'
    unless @recipe.user == @current_user
      redirect_to root_path
      return
    end

    # update image(if any), in 2x steps
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @recipe.image = req["public_id"]
      @recipe.save
    end

    # update with strong params, .update change DB directly, and returns true/false
    if @recipe.update params_recipe
      # successful DB update
      redirect_to recipe_path params[:id]
    else
      # failed DB update
      flash.now[:errors] = @recipe.errors.full_messages
      render :edit
    end
  end


  def index

  end

  def show
    @recipe = Recipe.find params[:id]
    # p @current_user
  end

  def destroy

  end

  private

  def params_recipe
    params.require(:recipe).permit(:category_id, :name, :ingredients)
  end
end
