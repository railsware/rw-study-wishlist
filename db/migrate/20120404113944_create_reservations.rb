class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :wish_id
      t.integer :person_id
      t.timestamp :reservation_date

      t.timestamps
    end
  end
end
