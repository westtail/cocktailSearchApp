class CreateCocktailmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktailmarks do |t|
      t.references :user, foreign_key: true
      t.references :cocktail, foreign_key: true

      t.timestamps
      t.index [:user_id, :cocktail_id], unique: true # 追加
    end
  end
end
