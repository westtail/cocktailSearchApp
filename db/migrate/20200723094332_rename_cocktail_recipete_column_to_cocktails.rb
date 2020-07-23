class RenameCocktailRecipeteColumnToCocktails < ActiveRecord::Migration[5.2]
  def change
    rename_column :cocktails, :cocktail_recipete, :cocktail_recipe
  end
end
