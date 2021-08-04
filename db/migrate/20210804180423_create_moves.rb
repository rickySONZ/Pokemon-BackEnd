class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :move_id
      t.integer :accuracy
      t.integer :power
      t.integer :pp
      t.integer :priority
      t.string :effect
      t.integer :effect_chance
      t.string :pokemon_type
      t.text :flavor_text
      t.boolean :special, default: false
      t.timestamps
    end
  end
end
