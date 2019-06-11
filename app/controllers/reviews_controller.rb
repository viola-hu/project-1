class ReviewsController < ApplicationController

  def create
    # as we got all the necessary info from params and @current_user, can .create at once
    @review = Review.create(
      rating: params[:rating],
      comment: params[:comment],
      user_id: @current_user.id,
      recipe_id: params[:id]
    )

    if @review.persisted?
      redirect_to recipe_path(params[:id])
    else
      flash.now[:errors] = @review.errors.full_messages

      # Need to load this here because we are NOT
      # going through the recipes controller which
      # would normally do this query
      @recipe = Recipe.find params[:id]

      # when render a template from a different controller
      # need to write 'controller/template'
      render 'recipes/show'

    end
  end


  def edit
  end

  def update
  end

  def destroy
  end


end
