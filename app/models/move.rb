class Move < ApplicationRecord

    scope :power_moves_only, -> { where("power > 0") }
end
