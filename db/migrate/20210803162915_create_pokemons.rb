class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :uid
      t.text :types, array: true, default: []
      t.text :moves_names_only, array: true, default: []
      t.string :front_image
      t.string :back_image
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.integer :tier

      t.timestamps
    end
  end
end
