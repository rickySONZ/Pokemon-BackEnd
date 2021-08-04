class Pokemon < ApplicationRecord
  validates :name, :uid, :front_image, :back_image, :hp, :attack, :defense, :special_attack, :special_defense, :speed,  presence: true
  validates :uid, uniqueness: true

end
