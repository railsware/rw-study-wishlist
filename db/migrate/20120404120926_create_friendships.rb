class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :person_id
      t.string :friend_id

      t.timestamps
    end
    add_index :friendships, :person_id
  end
end
