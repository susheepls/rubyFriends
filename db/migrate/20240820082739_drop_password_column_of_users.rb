class DropPasswordColumnOfUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :password, :string
  end
end
