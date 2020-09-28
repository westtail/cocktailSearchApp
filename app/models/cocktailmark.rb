class Cocktailmark < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail
  validates :user_id, uniqueness: { scope: :cocktail_id } # 追加
end
