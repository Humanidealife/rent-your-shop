class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :ending_date
      t.float :total_price
      t.string :status, default: "pending"
      t.references :shop, null: false, foreign_key: true
      t.references :renter, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
