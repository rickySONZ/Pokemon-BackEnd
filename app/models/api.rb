require "httparty"
class Api < ApplicationRecord

    def self.pokemon_pull()
      # hp check how its formated could do a loo[ to checl base_stat
        url = "https://pokeapi.co/api/v2/pokemon/1"
        pokemon_array = HTTParty.get(url)
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

    def self.moves_pokemon
      url = "https://pokeapi.co/api/v2/move/209"
      move_array = HTTParty.get(url)
      m = Move.new(
        name: move_array["name"],
        move_id: move_array["id"],
        accuracy: move_array["accuracy"],
        power: move_array["power"],
        pp: move_array["pp"],
        priority: move_array["priority"],
        effect_chance: move_array["effect_chance"],
        pokemon_type: move_array["type"]["name"],
      )
      if move_array["damage_class"]["name"] === "special"
        m.special = true
      end
      move_array["flavor_text_entries"].each do |f|
        if f["language"]["name"] === "en"
          m.flavor_text = f["flavor_text"]
        end
      end
      moveVar = move_array["effect_entries"][0]["short_effect"]
      if m.effect_chance != nil
      if moveVar.include?("burn")
        m.effect = "burn"
      end
      if moveVar.include?("poison")
        m.effect = "poison"
      end
      if moveVar.include?("paralyze")
        m.effect = "paralyze"
      end
      if moveVar.include?("sleep")
        m.effect = "sleep"
      end
      if moveVar.include?("bound")
        m.effect = "bound"
      end
    end
      binding.pry

    end


end
