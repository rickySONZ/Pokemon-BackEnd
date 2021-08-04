require "httparty"
class Api < ApplicationRecord

    def self.pokemon_pull()
      # hp check how its formated could do a loo[ to checl base_stat
        @url = "https://pokeapi.co/api/v2/pokemon/1"
        pokemon_array = HTTParty.get(@url)
        p = Pokemon.new(
           :name => pokemon_array["name"],
           :uid => pokemon_array["id"],
           :front_image => pokemon_array["sprites"]["other"]["official-artwork"]["front_default"],
           :back_image => pokemon_array["sprites"]["back_default"],
           :hp => pokemon_array["stats"][0]["base_stat"],
           :attack => pokemon_array["stats"][1]["base_stat"],
           :defense => pokemon_array["stats"][2]["base_stat"],
           :special_attack => pokemon_array["stats"][3]["base_stat"],
           :special_defense => pokemon_array["stats"][4]["base_stat"],
           :speed => pokemon_array["stats"][5]["base_stat"]
           )
        pokemon_array["moves"].each do |k|
          p.moves.push(k["move"]["name"])
        end
        pokemon_array["types"].each do |k|
          p.types.push(k["type"]["name"])
        end
        binding.pry
    end


end
