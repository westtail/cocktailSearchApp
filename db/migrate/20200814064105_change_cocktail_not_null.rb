class ChangeCocktailNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cocktails, :name, false
    change_column_null :cocktails, :base_alcohol, false
    change_column_null :cocktails, :taste, false
    change_column_null :cocktails, :alcohol_percentage, false
    change_column_null :cocktails, :glass_type, false

    change_column_null :ingredients, :name, false
    change_column_null :ingredients, :quantity, false
  end
end
