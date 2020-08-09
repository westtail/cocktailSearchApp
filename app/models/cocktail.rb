class Cocktail < ApplicationRecord
    has_many :ingredients
    mount_uploader :image, ImageUploader
    accepts_nested_attributes_for :ingredients, allow_destroy: true  
end
