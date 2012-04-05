class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :person_id
      t.string :friend_id
      t.string :show
      t.boolean :wishes

      t.timestamps
    end
  end
end
