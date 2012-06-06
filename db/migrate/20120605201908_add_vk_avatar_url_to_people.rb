class AddVkAvatarUrlToPeople < ActiveRecord::Migration
  def change
    add_column :people, :vk_avatar_url, :string

  end
end
