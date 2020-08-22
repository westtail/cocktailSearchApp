class CocktailsController < ApplicationController

  before_action :login_required, only: [:new,:create,:edit,:update,:destory]

  def index
    @q = Cocktail.ransack(params[:q])
    @cocktails = @q.result(distinct: true).page(params[:page]).per(18)
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
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: "カクテル「#{@cocktail.name}」が登録されました"  
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
    @ingredients = @cocktail.ingredients.build
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: "カクテル「#{@cocktail.name}」が更新されました"
    else
      render :edit
    end
  end

  def destroy
    cocktail = Cocktail.find(params[:id])
    cocktail.destroy
    redirect_to cocktails_path, notice: "カクテル「#{cocktail.name}」が削除されました"
  end
  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :taste, :base_alcohol, :glass_type, :alcohol_percentage, :cocktail_recipe, :image, ingredients_attributes: [:id, :name, :quantity, :_destroy])
  end
end
