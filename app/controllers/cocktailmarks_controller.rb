class CocktailmarksController < ApplicationController

  def create
    cocktailmark = current_user.cocktailmarks.build(cocktail_id: params[:cocktail_id])
    cocktailmark.save!
    redirect_to cocktails_path
  end

  def destroy
    current_user.cocktailmarks.find_by(cocktail_id: params[:cocktail_id]).destroy!
    redirect_to cocktails_path
  end
end

