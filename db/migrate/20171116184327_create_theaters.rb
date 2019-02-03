class CreateTheaters < ActiveRecord::Migration[5.0]
  def change
    create_table :theaters do |t|
      t.string  :name, null: false
      t.string  :phone
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string  :street
      t.string  :state
      t.string  :city
      t.string  :country
      t.string  :zipcode
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
