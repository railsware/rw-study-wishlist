class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :name
      t.string :url
      t.text :description
      t.has_attached_file :image
      t.integer :owner_id

      t.timestamps
    end
  end
end
