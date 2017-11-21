class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string  :title, null: false
      t.string  :genres, array: true, default: []
      t.string  :cast, array: true, default: []
      t.string  :directors, array: true, default: []
      t.string  :rating
      t.text    :short_description
      t.text    :long_description
      t.integer :year
      t.date    :release_date
      t.string  :language
      t.string  :official_url
      t.string  :image_url
      t.string  :api_id

      t.timestamps
    end
  end
end
