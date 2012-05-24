class CreatePeople < ActiveRecord::Migration
  def change
    create_table (:people, {:options=>"ENGINE=InnoDB DEFAULT CHARSET=utf8"}) do |t|
      t.string :name
      t.timestamp :birthday
      t.has_attached_file :avatar
      t.string :vk_id, :email, :privacy_type

      t.boolean :is_user
      t.string :role

      t.timestamps
    end
    add_index :people, :vk_id
  end
end
