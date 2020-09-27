class CocktailmarksController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
  end

  def create
    cocktail = current_user.cocktailmarks.build(cocktail_id: params[:cocktail_id])
    cocktail.save!
    redirect_to cocktailmarks_path, success: t('.flash.bookmark')
  end

  def destroy
    current_user.cocktailmarks.find_by(cocktail_id: params[:cocktail_id]).destroy!
    redirect_to cocktailmarks_path, success: t('.flash.not_bookmark')
  end

  def cocktailmarks
    @cocktails = current_user.cocktailmark.includes(:user).recent
  end
end

