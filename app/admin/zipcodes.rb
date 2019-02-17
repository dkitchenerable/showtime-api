ActiveAdmin.register Zipcode do

  index do
    selectable_column
    id_column
    column :code
    column :latitude
    column :longitude
    column :active
    actions
  end

  filter :code
  filter :active
end
