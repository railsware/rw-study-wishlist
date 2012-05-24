class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users, {:options=>"ENGINE=InnoDB DEFAULT CHARSET=utf8"}) do |t|
      t.string :name
      t.string :url
      t.string :avatar

      t.timestamps
    end
  end
end
