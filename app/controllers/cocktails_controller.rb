class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = @cocktail.ingredients
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.new(cocktail_params)
    cocktail.save!
    redirect_to cocktails_path
  end

  def edit
    @cocktail = Cocktail.find(params[:id]) 
  end

  def update
    cocktail = Cocktail.find(params[:id])
    cocktail.update!(cocktail_params)
    redirect_to cocktails_path
  end

  def destroy
    cocktail = Cocktail.find(params[:id])
    cocktail.destroy
    redirect_to cocktails_path
  end
  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :taste, :base_alcohol, :glass_type, :alcohol_percentage, :cocktail_recipe, :image)
  end
end
