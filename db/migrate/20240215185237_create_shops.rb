class CreateShops < ActiveRecord::Migration[7.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :description
      t.float :price_per_day
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :category
      t.float :rating
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
