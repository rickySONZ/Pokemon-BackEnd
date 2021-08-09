class CreateUserPokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :user_pokemons do |t|

      t.text :active_moves, array: true, default: []
      t.text :purchased_moves, array: true, default: []
      t.text :moves, array: true, default: []
      t.integer :user_id
      t.integer :pokemon_id
      t.timestamps
    end
  end
end
