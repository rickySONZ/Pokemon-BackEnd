# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
move_counter = 1
pokemon_counter = 1

while move_counter <= 742 do #742
  Api.moves_pokemon(move_counter)
  move_counter += 1
end

while pokemon_counter <= 5 do #807
  Api.pokemon_pull(pokemon_counter)
  pokemon_counter += 1
end

