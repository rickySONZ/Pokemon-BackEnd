class Move < ApplicationRecord

    scope :power_moves_only, -> { where("power > 0") }

    has_many :pokemon_moves
    has_many :pokemon, through: :pokemon_moves
  
end
