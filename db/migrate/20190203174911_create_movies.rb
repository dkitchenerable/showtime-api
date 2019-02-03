class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string    :title
      t.date      :release_date
      t.text      :description
      t.integer   :running_time_minutes
      t.string    :thumb_url

	    t.timestamps
    end
  end
end
