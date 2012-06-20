class AddWishNumAtLastViewToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :wish_num, :integer, :default => 0

  end
end
