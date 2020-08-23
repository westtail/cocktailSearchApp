class Cocktail < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    validates :base_alcohol, presence: true
    validates :taste, presence: true
    validates :alcohol_percentage, presence: true
    validates :glass_type, presence: true
    validates :cocktail_recipe, presence: true, length: { maximum: 200 }

    has_many :ingredients, :dependent => :destroy
    mount_uploader :image, ImageUploader
    accepts_nested_attributes_for :ingredients, allow_destroy: true

    belongs_to :user
end
