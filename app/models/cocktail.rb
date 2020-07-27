class Cocktail < ApplicationRecord
    has_many :ingredients
    mount_uploader :image, ImageUploader
end
