class CreateTheaters < ActiveRecord::Migration[5.0]
  def change
    create_table :theaters do |t|
      t.string  :name
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.string  :phone_number
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
