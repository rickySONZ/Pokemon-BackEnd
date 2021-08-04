class Pokemon < ApplicationRecord
  validates :name, :uid, :hp, :attack, :defense, :special_attack, :special_defense, :speed,  presence: true
  validates :uid, uniqueness: true

end
