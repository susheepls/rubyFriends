class CreateFriendships < ActiveRecord::Migration[7.2]
  def change
    create_table :friendships, primary_key: [:user_id, :friend_id] do |t|
      t.integer :user_id
      t.integer :friend_id
      # t.belongs_to :user, index: true
      # t.belongs_to :friend, index: true
      t.timestamps
    end
    add_foreign_key :friendships, :users, column: :user_id
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
