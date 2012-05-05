class AddRatingToWishes < ActiveRecord::Migration
  def change
    add_column :wishes, :rating, :integer

  end
end
