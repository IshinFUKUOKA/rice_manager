class CreateRice < ActiveRecord::Migration
  def change
    create_table :rice do |t|
      t.string :name
      t.integer :price
      t.integer :buyer_id
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
