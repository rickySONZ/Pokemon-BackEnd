class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :win_streak, default: 0
      t.integer :wins, default: 0
      t.string :uid
      t.timestamps
    end
  end
end
