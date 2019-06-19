class RecipesController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show, :by_food, :search]

  def search
    # raise 'hell'
    # # params:{"utf8"=>"✓", "query"=>"pineapple", "commit"=>"Search"}
    @results = Recipe.joins(:foods).where('recipes.ingredients ILIKE ? OR recipes.name ILIKE ? OR foods.name ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%").distinct
    # LIKE pattern matching always covers the entire string. Therefore, if it's desired to match a sequence anywhere within a string, the pattern must start and end with a percent sign.
    # a percent sign (%) matches any sequence of zero or more characters. e.g. 'abc' LIKE 'a%', true
    # The key word ILIKE can be used instead of LIKE to make the match case-insensitive according to the active locale. This is not in the SQL standard but is a PostgreSQL extension.
    # .distinct to avoid duplicates
  end

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
      # if saved into DB successfully

      # 1)
      # need to add recipe_id and food_id into the JOIN TABLE: foods_recipes
      # we've got recipe_id and food_ids (params_foods returns value of a hash with food id array)
      # params_foods[:food_ids] returns an array of food ids
      # Food.where id: ["377", "380"] -> returns an array of matching food objects
      # Now add all the foods that were ticked in the form,
      # as food associations for this recipe, using <<
      @recipe.foods << Food.where(id: params_foods[:food_ids])

      # 2) redirect to recipe show page
      redirect_to recipe_path(@recipe.id)
    else
      # if not saved, DB bounce back error!
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

      # 1)
      # update JOIN TABLE foods_recipes
      # ONLY NEED THIS FOR UPDATE
      # Delete all the food associations for this recipe before adding the new foods to it
      # as an easy way to avoid duplicates
      @recipe.foods.delete_all

      # 2)
      # Now add all the foods that were ticked in the form,
      # as new food associations for this recipe, using <<
      @recipe.foods << Food.where(id: params_foods[:food_ids])

      # 3)
      # redirect to recipe show page
      redirect_to recipe_path(@recipe.id)
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
    redirect_to categories_path
  end

  private

  def params_recipe
    params.require(:recipe).permit(:category_id, :name, :ingredients)
  end

  def params_foods
    # below returns a hash, key: food_ids, value: an array of food ids? CORRECT!
    params.require(:recipe).permit(:food_ids => [ ])
    # p[:food_ids].reject!(&:blank?)
  end

end
