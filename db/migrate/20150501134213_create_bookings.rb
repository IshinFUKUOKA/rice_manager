class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :booked_at
      t.integer :user_id

      t.timestamps
    end
  end
end
