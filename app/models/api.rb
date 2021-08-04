require "httparty"
class Api < ApplicationRecord

    def self.pokemon_pull()
        @url = "https://pokeapi.co/api/v2/pokemon/1"
        pokemon_array = HTTParty.get(@url)

        p = Pokemon.new(:name => pokemon_array["forms"]["name"],)
        binding.pry
    end


end
