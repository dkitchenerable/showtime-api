class CreateZipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zipcodes do |t|
      t.string  :code
      t.decimal :latitude
      t.decimal :longitude
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
