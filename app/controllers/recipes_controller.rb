class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new params_recipe
    @recipe.user_id = @current_user.id
    @recipe.save

    if @recipe.persisted?
      redirect_to recipe_path(@recipe.id) # redirect to recipe show page
    else
      flash[:errors] = @recipe.errors.full_messages
      render :new
    end
  end


  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy

  end

  private

  def params_recipe
    params.require(:recipe).permit(:category_id, :name, :image, :ingredients)
  end
end
