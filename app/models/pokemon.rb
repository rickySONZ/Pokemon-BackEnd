class Pokemon < ApplicationRecord
  validates :name, :uid, :hp, :attack, :defense, :special_attack, :special_defense, :speed,  presence: true
  validates :uid, uniqueness: true

  has_many :pokemon_moves
  has_many :moves, through: :pokemon_moves
  
end
