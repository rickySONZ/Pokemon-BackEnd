class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.text :moves, array: true, default: []
      t.text :types, array: true, default: []
      t.string :front_image
      t.string :back_image
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed


      t.timestamps
    end
  end
end
