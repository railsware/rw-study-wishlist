class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :name
      t.string :url
      t.text :description
      t.attachment :image
      t.integer :person_id

      t.timestamps
    end
  end
end
