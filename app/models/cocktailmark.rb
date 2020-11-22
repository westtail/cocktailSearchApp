class Cocktailmark < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail
  validates :user_id, uniqueness: { scope: :cocktail_id } # 追加

  def self.all_ranking
    Cocktail.find(Cocktailmark.group(:cocktail_id).order(Arel.sql('count(cocktail_id) desc')).limit(12).pluck(:cocktail_id))
  end

  def self.marks_number(id)
    Cocktailmark.where(cocktail_id: id).count
  end
end
