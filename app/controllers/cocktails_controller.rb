class CocktailsController < ApplicationController
  def index
    @q = Cocktail.ransack(params[:q])
    @cocktails = @q.result(distinct: true)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @ingredients = @cocktail.ingredients
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = @cocktail.ingredients.build
  end

  def create
    cocktail = Cocktail.new(cocktail_params)
    cocktail.save!
    redirect_to cocktails_path, notice: "カクテル「#{cocktail.name}」が登録されました"
  end

  def edit
    @cocktail = Cocktail.find(params[:id]) 
  end

  def update
    cocktail = Cocktail.find(params[:id])
    cocktail.update!(cocktail_params)
    redirect_to cocktails_path, notice: "カクテル「#{cocktail.name}」が更新されました"
  end

  def destroy
    cocktail = Cocktail.find(params[:id])
    cocktail.destroy
    redirect_to cocktails_path, notice: "カクテル「#{cocktail.name}」が削除されました"
  end
  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :taste, :base_alcohol, :glass_type, :alcohol_percentage, :cocktail_recipe, :image, ingredients_attributes: [:name, :quantity])
  end
end
