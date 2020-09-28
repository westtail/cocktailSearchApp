class CocktailmarksController < ApplicationController

  def create
    id = params[:cocktail_id]
    cocktailmark = current_user.cocktailmarks.build(cocktail_id: params[:cocktail_id])
    cocktailmark.save!
    redirect_to cocktail_path(id)
  end

  def destroy
    id = params[:cocktail_id]
    current_user.cocktailmarks.find_by(cocktail_id: params[:cocktail_id]).destroy!
    redirect_to cocktail_path(id)
  end
end

