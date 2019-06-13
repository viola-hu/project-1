class RecipesController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show, :by_food]

  def by_food
    # params pass over the food :id
    @food = Food.find_by id:params[:id]
    # store an array of recipes that belong to the food
    @recipes = @food.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # raise 'hell'
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

      # need to add recipe_id and food_id into the JOIN TABLE: foods_recipes
      # Q4: i've got recipe_id, food_ids - params_foods' return value of a hash?a

      # ONLY NEED THIS FOR UPDATE
      # Delete all the food associations for this recipe, as an
      # easy way to avoid duplicates
      # @recipe.foods.delete_all

      # Now add all the foods that were ticked in the form,
      # as food associations for this recipe
      @recipe.foods << Food.where(id: params_foods[:food_ids])

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
    # in UI elements, users can change recipe_id in the form,
    # and params carries this recipe_id
    # if the current_user is also the owner of the changed/new recipe_id, no problem, this user could initially change their own recipes
    # however, if the current_user is not the owner of the changed/new recipe_id, ERROR, bring them to homepage, cannot proceed to edit recipe, using 'return'
    unless @recipe.user == @current_user
      flash[:error] = "You cannot perform this action."
      redirect_to categories_path
      return
    end
  end

  def update
    @recipe = Recipe.find params[:id]

    # for same security reason as #edit
    unless @recipe.user == @current_user
      flash[:error] = "You cannot perform this action."
      redirect_to categories_path
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
    @category = Category.find_by id: params[:id]
    @recipes = @category.recipes
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  def destroy
    # Security purpose: same reason as #edit & #update, user can change recipe_id in elements page,
    # they are able to delete recipes even though the recipe is not theirs, thus need the below check!!
    @recipe = Recipe.find params[:id]
    unless @recipe.user == @current_user
      flash[:error] = "You cannot perform this action."
      redirect_to categories_path
      return
    end

    Recipe.destroy params[:id]
    # once the recipe owner deleted the recipe, redirect to user profile #show page
    redirect_to user_path @current_user
  end

  private

  def params_recipe
    params.require(:recipe).permit(:category_id, :name, :ingredients)
  end

  def params_foods
    # Q3: p is a hash? key: food_ids, value: an array of food ids? CORRECT!
    params.require(:recipe).permit(:food_ids => [ ])
    # , p now is a hash with filtered array value
    # p[:food_ids].reject!(&:blank?)
  end

end
