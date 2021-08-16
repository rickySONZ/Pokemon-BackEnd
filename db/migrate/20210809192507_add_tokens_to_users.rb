class AddTokensToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :tokens, :integer, default: 200
  end
end
