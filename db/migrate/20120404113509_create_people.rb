class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.timestamp :birthday
      t.attachment :avatar
      t.string :vk_id
      t.string :privacy_type
      t.boolean :is_user
      t.string :role

      t.timestamps
    end
  end
end
