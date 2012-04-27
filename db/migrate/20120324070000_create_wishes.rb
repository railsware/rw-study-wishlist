class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :name
      t.string :url
      t.integer :rating

      t.timestamps
    end
  end
end
