# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
move_counter = 1
pokemon_counter = 1 # start at 25

## For the proper association between moves and pokemon, you need to seed moves before pokemon
while move_counter <= 742 do #742
  Api.moves_pokemon(move_counter)
  move_counter += 1
end

while pokemon_counter <= 807 do #807
  Api.pokemon_pull(pokemon_counter)
  pokemon_counter += 1
end

