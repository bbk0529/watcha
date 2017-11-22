class AddRollToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string, :default => "regular", :null => false
  end
end
