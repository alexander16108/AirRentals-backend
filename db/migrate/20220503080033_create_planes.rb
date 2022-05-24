class CreatePlanes < ActiveRecord::Migration[7.0]
  def change
    create_table :planes do |t|
      t.string :name
      t.integer :capacity
      t.string :range
      t.string :url
      t.string :speed
      t.string :city
      t.string :images
      t.string :price
      t.date :reservation_expiration_date

      t.timestamps
    end
  end
end
