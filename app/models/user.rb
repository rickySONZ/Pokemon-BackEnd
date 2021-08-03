class User < ApplicationRecord

   def name 
   end


  validates :email presence: true
end
