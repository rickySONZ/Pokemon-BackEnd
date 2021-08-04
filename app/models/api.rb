require "httparty"
class Api < ApplicationRecord

    def self.pokemon_pull()
        @url = "https://pokeapi.co/api/v2/pokemon/1"
        pokemon_array = HTTParty.get(@url)
        p = Pokemon.new(
           :name => pokemon_array["name"],
           :front_image => pokemon_array["sprites"]["other"]["official-artwork"]["front_default"],
           :back_image => pokemon_array["sprites"]["back_default"])
        pokemon_array["moves"].each do |k|
          p.moves.push(k["move"]["name"])
        end
        pokemon_array["types"].each do |k|
          p.types.push(k["type"]["name"])
        end
        binding.pry
    end


end
