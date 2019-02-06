class CreateShowtimes < ActiveRecord::Migration[5.0]
  def change
    create_table :showtimes do |t|
      t.references :movie
      t.references :theater
      t.date       :screening_date
      t.time       :screening_time
      t.string     :ticket_link

      t.timestamps
    end
  end
end
