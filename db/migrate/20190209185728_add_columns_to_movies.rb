class AddColumnsToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column  :movies,  :rating, :string
    add_column  :movies,  :short_description, :string
    add_column  :movies,  :language, :string
    add_column  :movies,  :api_id,  :string
  end
end
