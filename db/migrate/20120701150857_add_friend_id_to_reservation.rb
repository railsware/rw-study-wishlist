class AddFriendIdToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :friend_id, :integer
  end
end
