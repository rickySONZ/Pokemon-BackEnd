# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
move_counter = 1
pokemon_counter = 1

while pokemon_counter <= 20 do#1118
  Api.pokemon_pull(pokemon_counter)
  pokemon_counter += 1
end


# while move_counter <= 844
#   Api.moves_pokemon(move_counter)
#   move_counter++
# end

