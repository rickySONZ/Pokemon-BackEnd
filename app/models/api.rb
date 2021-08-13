
require "httparty"


class Api < ApplicationRecord

## This pulls description from pokedex site due to lack of info on API
  def self.pokemon_description_pull(num, p)
    doc = Nokogiri::HTML(URI.open("https://www.pokemon.com/us/pokedex/#{num}"))

    desc = doc.xpath('/html/body/div[4]/section[3]/div[2]/div/div[1]/p[2]').inner_html.strip!
    p.description = desc 
   
  end

    def self.pokemon_pull(id)
      
      
        url = "https://pokeapi.co/api/v2/pokemon/#{id}"
        pokemon_array = HTTParty.get(url)
        p = Pokemon.new(
           :name => pokemon_array["name"].capitalize,
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
          move_name = k["move"]["name"].split("-")
          move_name = move_name.map do |m|
            m.capitalize
          end
          p.moves_names_only.push(move_name.join(" "))
        end

        pokemon_array["types"].each do |k|
          p.types.push(k["type"]["name"].capitalize)
        end
        pstats = p.speed + p.defense + p.hp + p.special_attack + p.special_defense + p.attack 
        if pstats < 335
          p.tier = 1
        elsif pstats < 480
          p.tier = 2
        else p.tier = 3
        end

        ## The save for the pokemon is happening in the description pull to avoid redundancy
        Api.pokemon_description_pull(id, p)
<<<<<<< HEAD
=======
        p.save
        p.moves_names_only.each do |move|
          add_move = Move.find_by_name(move)

          # This line is filtering out moves with no power from being assgined to Pokemon
          # To have moves with only effects appear delete this line
          if add_move && add_move.power
          newMove = PokemonMove.create(:pokemon_id => p.uid, :move_id => add_move.id)
          end
        end

>>>>>>> origin/main
    end

    def self.moves_pokemon(id)
      url = "https://pokeapi.co/api/v2/move/#{id}"
      move_array = HTTParty.get(url)
      m = Move.new(
        name: move_array["name"].capitalize,
        uid: move_array["id"],
        accuracy: move_array["accuracy"],
        power: move_array["power"],
        pp: move_array["pp"],
        priority: move_array["priority"],
        effect_chance: move_array["effect_chance"],
        pokemon_type: move_array["type"]["name"].capitalize,
      )

      m.name = m.name.split("-").map do |n|
        n.capitalize
      end.join(" ")
      
      if move_array["damage_class"]["name"] === "special"
        m.special = true
      end
      move_array["flavor_text_entries"].each do |f|
        if f["language"]["name"] === "en"
          m.flavor_text = f["flavor_text"]
        end
      end
      moveVar = move_array["effect_entries"][0]["effect"]
      
      if moveVar.include?("burn")
        m.effect = "Burn"
      end
      if moveVar.include?("poison")
        m.effect = "Poison"
      end
      if moveVar.include?("paralyze")
        m.effect = "Paralyze"
      end
      if moveVar.include?("sleep")
        m.effect = "Sleep"
      end
      if moveVar.include?("bound")
        m.effect = "Bound"
      end
      m.save!

    end
    

end
