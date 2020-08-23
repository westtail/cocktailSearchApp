class AddUserToCocktails < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM cocktails'
    add_reference :cocktails, :user, null: false, index: true
  end

  def down 
    remove_reference :cocktails, :user, index: true
  end
end
