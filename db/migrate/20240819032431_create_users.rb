class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :username, index: {:unique => true}
      t.string :password
      t.string :profile_name, index: {:unique => true}
      t.text :description
      t.timestamps
    end
  end
end
