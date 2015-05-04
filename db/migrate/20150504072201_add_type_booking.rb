class AddTypeBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :type, :string
  end
end
