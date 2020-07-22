class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :base_alcohol
      t.string :taste
      t.string :alcohol_percentage
      t.string :glass_type
      t.text :cocktail_recipete

      t.timestamps
    end
  end
end
