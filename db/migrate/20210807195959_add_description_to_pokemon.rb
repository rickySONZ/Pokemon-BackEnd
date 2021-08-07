class AddDescriptionToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :description, :string
  end
end
